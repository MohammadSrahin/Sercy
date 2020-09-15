import 'package:flutter/material.dart';
import 'package:sercy/screens/chat_screen.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:sercy/backend/database.dart';

class SearchingScreen extends StatefulWidget {
  static const id = 'searching_screen';
  @override
  _SearchingScreenState createState() => _SearchingScreenState();
}

class _SearchingScreenState extends State<SearchingScreen> {
  final DatabaseManager databaseManager = DatabaseManager();
  String chatRoom;

  chatSetUp() async {
    chatRoom = await databaseManager.createAChatRoomID();
    print(chatRoom);
    if (chatRoom == 'noUsers') {
      while (chatRoom == 'noUsers') {
        chatRoom = await databaseManager.createAChatRoomID();
        print("new chatRoom: $chatRoom");
      }
    }
    Navigator.popAndPushNamed(context, ChatScreen.id, arguments: chatRoom);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    chatSetUp();
    // Navigator.popAndPushNamed(context, ChatScreen.id, arguments: chatRoom);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: LoadingBouncingGrid.circle(),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Text(
                  "Looking for a pair...",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, ChatScreen.id,
                    arguments: chatRoom);
              },
              child: Text("Push me to go to chat"),
            ),
          ],
        ),
      ),
    );
  }
}
