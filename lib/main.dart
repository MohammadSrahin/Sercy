import 'package:flutter/material.dart';
import 'package:sercy/screens/chat_screen.dart';
import 'package:sercy/screens/intro_screen.dart';
import 'package:sercy/screens/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: IntroScreen.id,
      routes: {
        ChatScreen.id: (context) => ChatScreen(),
        IntroScreen.id: (context) => IntroScreen(),
        WelcomeScreen.id:(context) =>WelcomeScreen(),
      },
    );
  }
}
