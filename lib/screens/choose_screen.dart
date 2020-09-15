import 'package:flutter/material.dart';
import 'package:sercy/backend/auth.dart';
import 'chat_screen.dart';
import '../backend/database.dart';
import 'sizes_helpers.dart';

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
        margin: EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'logo',
              child: Container(
                child: Center(
                  child: Image(
                    image: AssetImage('images/tlogo6.png'),
                    //height: 200,
                    height: displayHeight(context) * 0.28,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 45,
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
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.grey[300])),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xffe67096),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image(
                        image: AssetImage('images/ear.png'),
                        height: displayHeight(context) * 0.095,
                      ),
                    ),
                    SizedBox(
                      width: displayWidth(context) * 0.055,
                      //width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Listener / Counselor",
                          softWrap: true,
                          style: TextStyle(
                              // fontSize: 25,
                              fontSize: displayWidth(context) * 0.05,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: displayHeight(context) * 0.006,
                        ),
                        Text(
                          "Who wants to listen and\ngive advice to other people",
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: displayWidth(context) * 0.035),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: displayHeight(context) * 0.0475,
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
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.grey[300])),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image(
                        image: AssetImage('images/vent.png'),
                        height: displayHeight(context) * 0.095,
                      ),
                    ),
                    SizedBox(
                      width: displayWidth(context) * 0.055,
                      //width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Venter",
                          softWrap: true,
                          style: TextStyle(
                              fontSize: displayWidth(context) * 0.07,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: displayHeight(context) * 0.006,
                        ),
                        Text(
                          "Who wants to listen and\ngive advice to other people",
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: displayWidth(context) * 0.035),
                        )
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
