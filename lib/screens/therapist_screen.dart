import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'sizes_helpers.dart';
import '../therapist_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class TherapistScreen extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static const id = 'therapist_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 39, 0, 13),
          // EdgeInsets.symmetric(vertical: 30, horizontal: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 34),
                child: Text(
                  "Choose a\nTherapist",
                  style: TextStyle(
                      fontSize: displayWidth(context) * 0.12,
                      //fontSize: 40,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
              ),

              SizedBox(
                height: displayHeight(context) * 0.035,
                //height: 70.0,
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: <Widget>[
                      StreamBuilder(
                          stream: _firestore
                              .collection('therapist_users')
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            final therapists = snapshot.data.docs;
                            List<Widget> therapistWidgets = [];
                            for (var therapist in therapists) {
                              final name = therapist.data()["name"];
                              final description =
                                  therapist.data()["description"];
                              final cost = therapist.data()["cost"];
                              final imageLink = therapist.data()['image'];
                              final therapistWidget = TherapistListTile(
                                description: description,
                                name: name,
                                cost: cost,
                                profileImage: imageLink,
                              );
                              therapistWidgets.add(therapistWidget);
                            }
                            return Expanded(
                              flex: 10,
                              child: ListView(
                                children: therapistWidgets,
                              ),
                            );
                          }),
                    ],
                  ),
                ),
              ),
              // SizedBox(
              //   height: displayHeight(context) * 0.0475,
              //   // height: 35,
              // ),
              Column(
                //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: displayHeight(context) * 0.014,
                  ),
                  GestureDetector(
                    onTap: () {
                      Alert(
                          context: context,
                          title: "LOGIN",
                          content: Column(
                            children: <Widget>[
                              TextField(
                                decoration: InputDecoration(
                                  icon: Icon(Icons.account_circle),
                                  labelText: 'Username',
                                ),
                              ),
                              TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  icon: Icon(Icons.lock),
                                  labelText: 'Password',
                                ),
                              ),
                            ],
                          ),
                          buttons: [
                            DialogButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text(
                                "LOGIN",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            )
                          ]).show();
                    },
                    child: Container(
                      // width: 250,
                      width: displayWidth(context) * 0.8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFF827e96)),
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: <Widget>[
                          Image(
                            image: AssetImage('images/login.png'),
                            width: displayWidth(context) * 0.09,
                          ),
                          SizedBox(
                            width: displayWidth(context) * 0.05,
                          ),
                          Center(
                              child: Text(
                            'Sign in ',
                            style: TextStyle(
                                fontSize: displayWidth(context) * 0.055,
                                color: Colors.white,
                                letterSpacing: 2,
                                fontWeight: FontWeight.bold),
                          )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: displayHeight(context) * 0.013,
                    //height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      launch(
                          'https://docs.google.com/forms/d/1ngMFZkXB4sIc-mrRGm9zCrwj5M6eT6AKufm0FTV6K2s/edit');
                    },
                    child: Container(
                        // width: 250,
                        width: displayWidth(context) * 0.8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFF827e96)),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Image(
                              image: AssetImage('images/join.png'),
                              width: displayWidth(context) * 0.09,
                            ),
                            SizedBox(
                              width: displayWidth(context) * 0.05,
                            ),
                            Center(
                                child: Text(
                              'Join us',
                              style: TextStyle(
                                  fontSize: displayWidth(context) * 0.055,
                                  color: Colors.white,
                                  letterSpacing: 2,
                                  fontWeight: FontWeight.bold),
                            )),
                          ],
                        )
                        // child: Center(child: Text('Sign up ',style: TextStyle(fontSize: displayWidth(context)*0.055,color: Colors.white,letterSpacing: 2,fontWeight: FontWeight.bold),)),
                        ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      // ),
    );
  }
}

/*Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                "Choose a\nTherapist",
                style: TextStyle(
                    fontSize: displayWidth(context) * 0.12,
                    //fontSize: 40,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ),
            StreamBuilder(
                stream: _firestore.collection('therapist_users').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final therapists = snapshot.data.docs;
                  List<Widget> therapistWidgets = [];
                  for (var therapist in therapists) {
                    final name = therapist.data()["name"];
                    final description = therapist.data()["description"];
                    final cost = therapist.data()["cost"];
                    final imageLink = therapist.data()['image'];
                    final therapistWidget = TherapistListTile(
                      description: description,
                      name: name,
                      cost: cost,
                      profileImage: imageLink,
                    );
                    therapistWidgets.add(therapistWidget);
                  }
                  return Expanded(
                    flex: 10,
                    child: ListView(
                      children: therapistWidgets,
                    ),
                  );
                }),
            Expanded(
              child: RaisedButton(
                color: Colors.black,
                onPressed: () {

                },
                child:Text('Sign in as a therapist',style: TextStyle(color: Colors.white),),

              ),
            ),
          ],
        ),
      ),*/
