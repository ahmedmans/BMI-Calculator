// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore, avoid_print, unnecessary_null_comparison

import 'dart:math';

import 'package:bmi_calcultor/Screens/result_screen.dart';
import 'package:bmi_calcultor/constans.dart';
import 'package:bmi_calcultor/model/bmi_model.dart';
import 'package:bmi_calcultor/widgets/age_weight_container.dart';
import 'package:bmi_calcultor/widgets/gender_widget.dart';
import 'package:bmi_calcultor/widgets/slider_widegt.dart';
import 'package:flutter/material.dart';

class BMICalculator extends StatefulWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  bool? isMale = true;
  double height = 50.0;
  int age = 15;
  int weight = 100;
  double _bmi = 0;
  BMIModel? _bmiModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: kPRIMRYCOLOR,
          child: Column(
            children: [
              AppBar(
                elevation: 0,
                title: const Text(
                  'BMI Calculator',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                centerTitle: true,
                backgroundColor: kPRIMRYCOLOR,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GenderContainer(
                        color: isMale!
                            ? Colors.deepPurple[200]
                            : Colors.deepPurple[400],
                        icons: Icons.male,
                        onTap: () => setState(() {
                          isMale = true;
                          isMale! ? print("male") : null;
                        }),
                        text: 'MALE',
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      GenderContainer(
                        color: !isMale! ? pressColor : kSACANDECOLOR,
                        onTap: () => setState(() {
                          isMale = false;
                          !isMale! ? print("female") : null;
                        }),
                        text: 'FEMALE',
                        icons: Icons.female,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: SliderWidget(
                    height: height,
                    onChange: (value) {
                      setState(() {
                        height = value;
                        print('H : ${height.round()}');
                      });
                    },
                    title: 'HEIGHT',
                    textH: '${height.round()}',
                    textCM: 'CM',
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      AgeAndWeighContainer(
                        num: "$age",
                        title: 'AGE',
                        tagHero1: 'age--',
                        tagHero2: 'age++',
                        onPressM: () {
                          setState(() {
                            age = age - 1;
                            print("$age");
                          });
                        },
                        onPressP: () {
                          setState(() {
                            age = age + 1;
                            print('$age');
                          });
                        },
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      AgeAndWeighContainer(
                        num: '$weight',
                        title: 'WEIGHT',
                        tagHero1: 'weight--',
                        tagHero2: 'weight++',
                        onPressM: () {
                          setState(() {
                            weight = weight - 1;
                            print("$weight");
                          });
                        },
                        onPressP: () {
                          setState(() {
                            weight = weight + 1;
                            print('$weight');
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                color: kSACANDECOLOR,
                child: MaterialButton(
                  child: Text(
                    "CALCULATE",
                    style: titleStyle,
                  ),
                  onPressed: () {
                    setState(() {
                      _bmi = weight / pow(height / 100, 2);
                      print('_bmi : $_bmi');
                      if (_bmi >= 18.5 && _bmi <= 25) {
                        _bmiModel = BMIModel(
                            bmi: _bmi,
                            isNormal: true,
                            comments: "You are Totaly Fit");
                      } else if (_bmi < 18.5) {
                        _bmiModel = BMIModel(
                            bmi: _bmi,
                            isNormal: false,
                            comments: "You are Underweighted");
                      } else if (_bmi > 25 && _bmi <= 30) {
                        _bmiModel = BMIModel(
                            bmi: _bmi,
                            isNormal: false,
                            comments: "You are Overweighted");
                      } else {
                        _bmiModel = BMIModel(
                            bmi: _bmi,
                            isNormal: false,
                            comments: "You are Obesed");
                      }
                    });

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultScreen(
                            bmiModel: _bmiModel,
                          ),
                        ));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
