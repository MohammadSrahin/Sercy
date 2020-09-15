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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LoadingBouncingGrid.circle(
            backgroundColor: Colors.purple,
            size: 100,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Flexible(
              child: Text(
                "Please wait while we connect you with someone",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
