import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:sercy/screens/chat_screen.dart';
import 'package:sercy/screens/welcome_screen.dart';
import '../backend/auth.dart';

class IntroScreen extends StatefulWidget {
  static const id = 'slide_screen';
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = new List();
  final AuthManager authManager = AuthManager();
  @override
  void initState() {
    authManager.signInAnonymously();
    super.initState();

    slides.add(
      new Slide(
        title: "Welcome to Sercy",
        styleTitle: TextStyle(color: Color(0xff0078D7),

        ),
        description: "Description",
        pathImage: 'images/tlogo6.png',
        colorBegin: Color(0xffEFEFEF),
        colorEnd: Color(0xff802892),
      ),
    );
  }

  void onDonePress() {
    Navigator.pushNamed(context, WelcomeScreen.id);
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      slides: this.slides,
      onDonePress: this.onDonePress,
    );
  }
}
