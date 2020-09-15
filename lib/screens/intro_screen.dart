import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:sercy/screens/chat_screen.dart';
import 'package:sercy/screens/welcome_screen.dart';
import '../backend/auth.dart';
import 'sizes_helpers.dart';

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
        title: "Sercy",
        styleTitle: TextStyle(
          fontSize: 50,
          fontWeight: FontWeight.w600,
          //color: Colors.red[500],
          color: Color(0xFFE4644C),
          fontFamily: 'Raleway',
          letterSpacing: 5,
        ),
        description:
            "Sercy is an online \"talking therapy\" app where people can safely explore their difficulties with a view to bringing about changes for better.",
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
