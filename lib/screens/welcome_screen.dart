import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                  Container(
                    child: Expanded(
                      child: Image(
                        image: AssetImage('images/tlogo6.png'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Sercy',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 3,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 70.0,
              ),
              Container(
                padding: EdgeInsets.all(10),
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
                padding: EdgeInsets.all(10),
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
                          'Therapist',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text('will connect you with a \nprofessional therapist to \ntalk with anonymously',style:
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
