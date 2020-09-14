import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble({this.messageText, this.sender, this.isMe});
  final messageText;
  final sender;
  final bool isMe;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Material(
            borderRadius: isMe
                ? BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0))
                : BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                    topRight: Radius.circular(30.0)),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                messageText,
                style: TextStyle(
                    fontSize: 17, color: isMe ? Colors.white : Colors.black),
              ),
            ),
            elevation: 3,
            color: isMe ? Color(0xFFFFA6A6) : Color(0xffDADADA),
          ),
        ],
      ),
    );
  }
}
