import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
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
        styleTitle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w800,
          //color: Colors.red[500],
          color: Colors.black,
          fontFamily: 'RobotoMono',
          letterSpacing: 3,
        ),
        description:
        "Sercy is an online \"talking therapy\" app where people can safely explore their difficulties with other people in an anonymous way",
        styleDescription:TextStyle(color: Colors.white, fontSize: 20.0, fontStyle: FontStyle.italic,fontWeight: FontWeight.w400),
        pathImage: 'images/tlogo6.png',
        colorBegin: Color(0xffEFEFEF),
        colorEnd: Color(0xff802892),
      ),
    );
    slides.add(
      new Slide(
        title: "Therapist",
        styleTitle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w800,
          //color: Colors.red[500],
          color: Colors.black,
          fontFamily: 'RobotoMono',
          letterSpacing: 3,
        ),
        description:
            "Sercy has professional therapist that can advise you",
        styleDescription:TextStyle(color: Colors.white, fontSize: 20.0, fontStyle: FontStyle.italic,fontWeight: FontWeight.w400),
        pathImage: 'images/therapist.png',
        colorBegin: Color(0xffEFEFEF),
        colorEnd: Color(0xffD48B07),
      ),
    );
    slides.add(
      new Slide(
        title: "Anonymous Chat",
        styleTitle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w800,
          //color: Colors.red[500],
          color: Colors.black,
          fontFamily: 'RobotoMono',
          letterSpacing: 3,
        ),
        description:
        "Sercy enables you to communicate with a random person anonymously",
        styleDescription:TextStyle(color: Colors.white, fontSize: 20.0, fontStyle: FontStyle.italic,fontWeight: FontWeight.w400),
        pathImage: 'images/dice.png',
        colorBegin: Color(0xffEFEFEF),
        colorEnd: Color(0xff2899c9),
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

