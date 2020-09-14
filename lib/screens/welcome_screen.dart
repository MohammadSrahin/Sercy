import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
class WelcomeScreen extends StatefulWidget {
  static const id = 'welcome_screen';

  @override
  _WelcomeScreen createState() => _WelcomeScreen();
}

class _WelcomeScreen extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 60, horizontal: 34.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                //crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Hero(
                    tag: 'logo',
                    child: Container(
                      child: Image(
                        image: AssetImage('images/tlogo6.png'),
                        height: 150,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 150.0,
                    child: TyperAnimatedTextKit(
                      text:["Sercy"],
                      textStyle: TextStyle(
                        fontSize: 40.0,
                        fontFamily: "Ange"
                      ),
                      textAlign: TextAlign.start,
                      alignment: AlignmentDirectional.bottomStart,
                    ),

                  )
                ],
              ),
              SizedBox(
                height: 70.0,
              ),
              Container(

                padding: EdgeInsets.all(23),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.grey[300])),

                child: Row(
                  children: <Widget>[
                    Container(

                      decoration: BoxDecoration(
                        color: Color(0xffe67096),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image(
                        image: AssetImage('images/dice2.png'),
                        height: 70,
                      ),
                    ),


                    SizedBox(
                      width: 10,
                    ),


                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Random Chat',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('will connect you with a \nrandom person to talk with',style:
                        TextStyle(fontStyle: FontStyle.italic),)
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 35,),

              Container(
                padding: EdgeInsets.all(23),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.grey[300])),

                child: Row(
                  children: <Widget>[
                    Container(

                      decoration: BoxDecoration(
                        color: Color(0xffFFC61B),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image(
                        image: AssetImage('images/therapist.png'),
                        height: 70,
                      ),
                    ),


                    SizedBox(
                      width: 10,
                    ),


                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Therapist',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text('connect with a professional\ntherapist to talk with\nnonymously',style:
                        TextStyle(fontStyle: FontStyle.italic,
                        fontSize: 13))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
