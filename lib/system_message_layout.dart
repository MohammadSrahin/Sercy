import 'package:flutter/material.dart';

class SystemMessageBubble extends StatelessWidget {
  SystemMessageBubble({this.messageText, this.sender});
  final messageText;
  final sender;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Material(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0),
                topLeft: Radius.circular(30.0)),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                messageText,
                style: TextStyle(fontSize: 17, color: Colors.black),
              ),
            ),
            elevation: 3,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
