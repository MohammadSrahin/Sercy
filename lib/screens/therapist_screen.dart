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
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Choose a\nTherapist",
              style: TextStyle(
                  fontSize: displayWidth(context) * 0.12,
                  //fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
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
                    child: ListView(
                      children: therapistWidgets,
                    ),
                  );
                }),

            // SizedBox(
            //   height: 10,
            // ),
            // TherapistListTile(
            //   name: 'Therapist 1',
            //   description: 'Hello!!',
            //   profileImage: NetworkImage(
            //       'https://www.iconfinder.com/data/icons/occupation-and-people-avatar-vol-1-1/128/Woman_avatar_assistant_young_people_female_therapist-512.png'),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // TherapistListTile(
            //   name: 'Therapist 1',
            //   description: 'Hello!!',
            //   profileImage: NetworkImage(
            //       'https://www.iconfinder.com/data/icons/occupation-and-people-avatar-vol-1-1/128/Woman_avatar_assistant_young_people_female_therapist-512.png'),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // TherapistListTile(
            //   name: 'Therapist 1',
            //   description: 'Hello!!',
            //   profileImage: NetworkImage(
            //       'https://www.iconfinder.com/data/icons/occupation-and-people-avatar-vol-1-1/128/Woman_avatar_assistant_young_people_female_therapist-512.png'),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                text: "Want to join Sercy as a Therapist? Click here!",
                style: new TextStyle(color: Colors.blue),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    launch(
                        'https://docs.google.com/forms/d/1ngMFZkXB4sIc-mrRGm9zCrwj5M6eT6AKufm0FTV6K2s/edit');
                  },
              )
            ]))
          ],
        ),
      ),
    );
  }
}
