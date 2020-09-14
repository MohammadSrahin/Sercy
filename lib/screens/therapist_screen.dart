import 'package:flutter/material.dart';

class TherapistScreen extends StatelessWidget {
  static const id = 'therapist_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Text(
                "Choose\na Therapist",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              padding: EdgeInsets.all(30),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Color(0xffB8B8B8))),
              child: Row(
                children: [
                  CircleAvatar(),
                  SizedBox(
                    width: 20,
                  ),
                  Text("Therapist 1"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
