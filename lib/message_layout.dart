import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble({this.messageText, this.sender});
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
                topRight: Radius.circular(30.0)),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                messageText == null ? 'Hello' : messageText,
                style: TextStyle(fontSize: 17, color: Colors.white),
              ),
            ),
            elevation: 3,
            color: Color(0xFFFFA6A6),
          ),
        ],
      ),
    );
  }
}
