// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final bmiModel;
  ResultScreen({this.bmiModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.purple[900],
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'RESULT',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Your BMI is ${bmiModel.bmi.round()}",
              style: TextStyle(
                  color: Colors.green[700],
                  fontSize: 34,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "${bmiModel.comments}",
              style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 20,
            ),
            bmiModel.isNormal
                ? Text(
                    "Hi! Your BMI is Normal.",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  )
                : Text(
                    "Sadly! Your BMI is not Normal.",
                    style: TextStyle(
                        color: Colors.redAccent[700],
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
            SizedBox(
              height: 16,
            ),
            Container(
              child: TextButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                label: Text(
                  "CALCULATE AGAIN",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Colors.deepPurple[400],
                  ),
                ),
                //textColor: Colors.white,
                //color: Colors.pink,
              ),
              width: double.infinity,
              padding: EdgeInsets.only(left: 16, right: 16),
            )
          ],
        ),
      ),
    );
  }
}
