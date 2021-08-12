// ignore_for_file: prefer_const_constructors

import 'package:bmi_calcultor/constans.dart';
import 'package:flutter/material.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({
    Key? key,
    required this.height,
    required this.onChange,
    required this.title,
    required this.textH,
    required this.textCM,
  }) : super(key: key);

  final double height;
  final String title;
  final String textH;
  final String textCM;

  final Function? onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          10,
        ),
        color: Colors.deepPurple[400],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: titleStyle,
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                textH, //"${height.round()}",
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                textCM, //'CM',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Slider(
            min: 50.0,
            max: 300.0,
            value: height,
            divisions: 10,
            onChanged: onChange! as void Function(double),
            thumbColor: Colors.purple[900],
            activeColor: Colors.purple[900],
            inactiveColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
