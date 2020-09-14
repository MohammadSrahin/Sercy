import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sercy/backend/auth.dart';
import '../backend/database.dart';
import '../message_layout.dart';

class ChatScreen extends StatefulWidget {
  static const id = 'chat_screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final DatabaseManager databaseManager = DatabaseManager();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final AuthManager authManager = AuthManager();
  TextEditingController controller = TextEditingController();
  String chatRoom;
  String messageText;

  chatSetUp() async {
    chatRoom = await databaseManager.createAChatRoomID();
    databaseManager.addUserToActive();
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
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 20,
            ),
            onPressed: () {}),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // StreamBuilder<QuerySnapshot>(
            //     stream: _firestore
            //         .collection('Chatrooms')
            //         .doc('$chatRoom')
            //         .collection('messages')
            //         .orderBy('timestamp', descending: true)
            //         .snapshots(),
            //     builder: (context, snapshot) {
            //       if (snapshot.connectionState == ConnectionState.waiting) {
            //         return Center(
            //           child: CircularProgressIndicator(),
            //         );
            // //       }
            //       List<QueryDocumentSnapshot> messages = snapshot.data.docs;
            //
            //       return Expanded(
            //         child: ListView.builder(
            //           itemCount: messages.length,
            //           itemBuilder: (context, index) {
            //             return Text(messages[index].data()['text']);
            //           },
            //         ),
            //       );
            //     }),

            Expanded(child: Container()),
            MessageBubble(
              messageText: messageText,
              sender: "user1",
            ),
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
                    MessageBubble(
                      messageText: messageText,
                      sender: "user1",
                    );
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
