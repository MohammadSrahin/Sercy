import 'package:flutter/material.dart';
import 'package:sercy/screens/chat_screen.dart';
import 'package:sercy/screens/choose_screen.dart';
import 'package:sercy/screens/intro_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sercy/screens/therapist_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: TherapistScreen.id,
      routes: {
        ChatScreen.id: (context) => ChatScreen(),
        IntroScreen.id: (context) => IntroScreen(),
        TherapistScreen.id: (context) => TherapistScreen(),
        ChooseScreen.id: (context) => ChooseScreen(),
      },
    );
  }
}
