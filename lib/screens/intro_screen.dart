import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:sercy/screens/chat_screen.dart';

class IntroScreen extends StatefulWidget {
  static const id = 'slide_screen';
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "Welcome to Sercy",
        description: "Description",
        backgroundColor: Color(0xfff5a623),
      ),
    );
  }

  void onDonePress() {
    Navigator.pushNamed(context, ChatScreen.id);
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      slides: this.slides,
      onDonePress: this.onDonePress,
    );
  }
}
