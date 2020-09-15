import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'sizes_helpers.dart';
import '../therapist_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TherapistScreen extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static const id = 'therapist_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[Color(0xff862992), Color(0xffEEAAA56)]),
                ),
                child: RaisedButton(
                  onPressed: () {
                    launch(
                        'https://docs.google.com/forms/d/1ngMFZkXB4sIc-mrRGm9zCrwj5M6eT6AKufm0FTV6K2s/edit');
                  },
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: <Color>[
                        Color(0xff862992),
                        Color(0xffEEAAA56)
                      ]),
                    ),
                    child: Container(
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text:
                              "Want to join Sercy as a Therapist? Click here!",
                          style:
                              new TextStyle(color: Colors.white, fontSize: 16),
                        )
                      ])),
                    ),
                  ),
                  elevation: 5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
