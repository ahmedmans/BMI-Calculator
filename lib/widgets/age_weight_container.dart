import 'package:bmi_calcultor/constans.dart';
import 'package:flutter/material.dart';

class AgeAndWeighContainer extends StatelessWidget {
  const AgeAndWeighContainer({
    Key? key,
    required this.num,
    required this.title,
    required this.onPressM,
    required this.onPressP,
    this.tagHero1,
    this.tagHero2,
  }) : super(key: key);

  final String num;
  final String title;
  final GestureTapCallback? onPressM;
  final GestureTapCallback? onPressP;
  final Object? tagHero1;
  final Object? tagHero2;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            10,
          ),
          color: kSACANDECOLOR,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: titleStyle,
            ),
            Text(
              num,
              style: const TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  backgroundColor: kPRIMRYCOLOR,
                  onPressed: onPressM!,
                  heroTag: tagHero1!,
                  mini: true,
                  child: const Icon(
                    Icons.remove,
                  ),
                ),
                FloatingActionButton(
                  backgroundColor: kPRIMRYCOLOR,
                  onPressed: onPressP!,
                  heroTag: tagHero2!,
                  mini: true,
                  child: const Icon(
                    Icons.add,
                    //color: Colors.purple[900],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
