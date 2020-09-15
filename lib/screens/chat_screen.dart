import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sercy/backend/auth.dart';
import 'package:sercy/screens/choose_screen.dart';
import 'package:sercy/system_message_layout.dart';
import '../backend/database.dart';
import '../message_layout.dart';
import 'package:platform_alert_dialog/platform_alert_dialog.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen(this.chatRoom);
  final chatRoom;
  static const id = 'chat_screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final DatabaseManager databaseManager = DatabaseManager();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final AuthManager authManager = AuthManager();
  TextEditingController controller = TextEditingController();
  var messageText;
  bool isConnected = true;

  setUp() async {
    print("ChatScreen ChatRoom: " + widget.chatRoom.toString());

    String role = await databaseManager.getUserRole();
    role == 'listener'
        ? await databaseManager.removeUserFromListener()
        : await databaseManager.removeUserFromVenter();
    print("Role in setup: " + role);
    await databaseManager.addUserToActive();
    Map<String, String> systemMessage = {
      "user": "system",
      "message": "chat Started"
    };

    await _firestore
        .collection('Chatrooms')
        .doc("${widget.chatRoom}")
        .collection('messages')
        .doc('system')
        .set(systemMessage);

    //Navigator.popAndPushNamed(context, ChatScreen.id);
  }

  @override
  void initState() {
    super.initState();
    setUp();
    isConnected = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Chat",
          style: TextStyle(color: Colors.black),
        ),

        //AppBar Color
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Color(0xff862992), Color(0xffEE3A56)])),
        ),

        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 20,
            ),
            onPressed: () {
              showDialog<void>(
                context: context,
                builder: (BuildContext context) {
                  return PlatformAlertDialog(
                    title: Text('Leave Chat?'),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          Text(
                              'You are about to leave the chat, are you sure?'),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      PlatformDialogAction(
                        child: Text('Cancel'),
                        actionType: ActionType.Preferred,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      PlatformDialogAction(
                        child: Text('Proceed'),
                        onPressed: () {
                          setState(() {
                            isConnected = false;
                          });
                          databaseManager
                              .sendDisconnectedMessage(widget.chatRoom);
                          databaseManager.removeUserFromActive();
                          databaseManager.addUserToIdle();
                          Navigator.popAndPushNamed(context, ChooseScreen.id);
                        },
                      ),
                    ],
                  );
                },
              );
            }),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            StreamBuilder<QuerySnapshot>(
                stream: _firestore
                    .collection('Chatrooms')
                    .doc("${widget.chatRoom}")
                    .collection('messages')
                    .orderBy(
                      'timestamp',
                      descending: true,
                    )
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final messages = snapshot.data.docs;
                  List<Widget> messageWidgets = [];
                  for (var message in messages) {
                    final messageText = message.data()["text"];
                    final messageSender = message.data()["user"];

                    if (isConnected == false) {
                      final currentUser = authManager.getUID();
                      final messageWidget = MessageBubble(
                        sender: 'System',
                        messageText: 'Disconnected',
                        isMe: currentUser == messageSender,
                      );
                      messageWidgets.add(messageWidget);
                    } else {
                      final currentUser = authManager.getUID();
                      final messageWidget = MessageBubble(
                        sender: messageSender,
                        messageText: messageText,
                        isMe: currentUser == messageSender,
                      );
                      messageWidgets.add(messageWidget);
                    }
                  }
                  return Expanded(
                    child: ListView(
                      reverse: true,
                      children: messageWidgets,
                    ),
                  );
                }),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Theme(
                    data: ThemeData(
                        primaryColor: Colors.black87,
                        primaryColorDark: Colors.black87,
                        hintColor: Colors.black87),
                    child: TextField(
                      onChanged: (value) {
                        messageText = value;
                      },
                      controller: controller,
                      decoration: InputDecoration(
                        hintText: "Type a message...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  child: Icon(Icons.send),
                  onTap: () {
                    controller.clear();
                    _firestore
                        .collection('Chatrooms')
                        .doc('${widget.chatRoom}')
                        .collection('messages')
                        .add({
                      'user': authManager.getUID(),
                      'text': messageText,
                      'timestamp': Timestamp.now(),
                    });
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
