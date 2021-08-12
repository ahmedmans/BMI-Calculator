import 'package:bmi_calcultor/constans.dart';
import 'package:flutter/material.dart';

class GenderContainer extends StatelessWidget {
  const GenderContainer({
    Key? key,
    required this.onTap,
    required this.text,
    required this.icons,
    required this.color,
  }) : super(key: key);

  //final bool? isMale;
  final Color? color;
  final GestureTapCallback? onTap;
  final String? text;
  final IconData? icons;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap!,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              10,
            ),
            color: color!,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Icon(
                icons!,
                size: 70,
                color: kPRIMRYCOLOR,
              ),
              const SizedBox(
                height: 15.0,
              ),
              Text(
                text!,
                style: titleStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
