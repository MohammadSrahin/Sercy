import 'package:flutter/material.dart';
import 'package:sercy/backend/auth.dart';
import 'chat_screen.dart';
import '../backend/database.dart';

class ChooseScreen extends StatefulWidget {
  static const id = 'choose_screen';
  @override
  _ChooseScreenState createState() => _ChooseScreenState();
}

class _ChooseScreenState extends State<ChooseScreen> {
  final DatabaseManager databaseManager = DatabaseManager();
  static const id = 'choose_screen';
  final AuthManager _auth = AuthManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                "Choose a\nTherapist",
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                databaseManager.addUserToListener();
                databaseManager.removeUserFromIdle();
                Navigator.pushNamed(context, ChatScreen.id);
              },
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey[300])),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage(
                          'https://www.iconfinder.com/data/icons/occupation-and-people-avatar-vol-1-1/128/Woman_avatar_assistant_young_people_female_therapist-512.png'),
                      backgroundColor: Colors.transparent,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Listener",
                          softWrap: true,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text("Listen")
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                databaseManager.addUserToVenter();
                databaseManager.removeUserFromIdle();
                Navigator.pushNamed(context, ChatScreen.id);
              },
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey[300])),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage(
                          'https://www.iconfinder.com/data/icons/occupation-and-people-avatar-vol-1-1/128/Woman_avatar_assistant_young_people_female_therapist-512.png'),
                      backgroundColor: Colors.transparent,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Venter",
                          softWrap: true,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text("Vent")
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
