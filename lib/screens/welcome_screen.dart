import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:sercy/backend/auth.dart';
import 'package:sercy/backend/database.dart';
import 'package:sercy/screens/choose_screen.dart';
import 'package:sercy/screens/therapist_screen.dart';
import 'sizes_helpers.dart';

class WelcomeScreen extends StatefulWidget {
  static const id = 'welcome_screen';

  @override
  _WelcomeScreen createState() => _WelcomeScreen();
}

class _WelcomeScreen extends State<WelcomeScreen> {
  final AuthManager authManager = AuthManager();
  final DatabaseManager databaseManager = DatabaseManager();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 60, horizontal: 34.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                //crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Hero(
                    tag: 'logo',
                    child: Container(
                      child: Image(
                        image: AssetImage('images/tlogo6.png'),
                        height: displayHeight(context) * 0.2,
                      ),
                    ),
                  ),
                  SizedBox(width: 4),
                  Expanded(
                    child: TypewriterAnimatedTextKit(
                      duration: Duration(seconds: 5),
                      // pause: Duration(seconds: 1),
                      text: ["Sercy"],
                      textStyle: TextStyle(
                        fontSize: displayWidth(context) * 0.125,
                        //fontSize: 45.0,
                        fontFamily: "An",
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.start,
                      alignment: AlignmentDirectional.bottomStart,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: displayHeight(context) * 0.095,
                //height: 70.0,
              ),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.grey[300])),
                child: GestureDetector(
                  onTap: () {
                    authManager.signInAnonymously();
                    databaseManager.addUserToIdle();
                    Navigator.pushNamed(context, ChooseScreen.id);
                  },
                  child: Row(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          //color: Color(0xffFFA6A6),
                          color: Color(0xffe67096),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image(
                          image: AssetImage('images/dice2.png'),
                          height: displayHeight(context) * 0.095,
                          //height: 70,
                        ),
                      ),
                      SizedBox(
                        width: displayWidth(context) * 0.055,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Random Chat',
                            style: TextStyle(
                              fontSize: displayWidth(context) * 0.07,
                              // fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: displayHeight(context) * 0.006,
                          ),
                          Text(
                            'will connect with a random\nperson to talk with',
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: displayWidth(context) * 0.035),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: displayHeight(context) * 0.0475,
                // height: 35,
              ),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.grey[300])),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, TherapistScreen.id);
                  },
                  child: Row(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xffFFC61B),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image(
                          image: AssetImage('images/therapist.png'),
                          height: displayHeight(context) * 0.095,
                          // height: 70,
                        ),
                      ),
                      SizedBox(
                        width: displayWidth(context) * 0.055,
                        //width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Therapist',
                            style: TextStyle(
                              fontSize: displayWidth(context) * 0.07,
                              //fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: displayHeight(context) * 0.006,
                          ),
                          Text(
                            'connect with a professional\ntherapist to talk with\nanonymously',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              //fontSize: 13
                              fontSize: displayWidth(context) * 0.035,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
