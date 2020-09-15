import 'package:flutter/material.dart';
import 'package:sercy/screens/sizes_helpers.dart';
//                  'https://www.iconfinder.com/data/icons/occupation-and-people-avatar-vol-1-1/128/Woman_avatar_assistant_young_people_female_therapist-512.png'),

class TherapistListTile extends StatelessWidget {
  TherapistListTile(
      {this.onTap, this.profileImage, this.name, this.description, this.cost});
  final onTap;
  final String profileImage;
  final String name;
  final String cost;
  final String description;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey[300])),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(profileImage),
              backgroundColor: Colors.transparent,
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  softWrap: true,
                  style: TextStyle(
                      fontSize: displayWidth(context) * 0.0555,
                      fontWeight: FontWeight.bold),
                ),
                Text(description),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
