import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/bottom_button.dart';

class Result extends StatelessWidget {
  final String bmi;
  final String result;
  final String advice;
  final Color color;

  Result({this.advice, this.bmi, this.result, this.color});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Center(
              child: Container(
                child: Text(
                  'Your Result',
                  style: kTitleTextStyle,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kReusableCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '$result'.toUpperCase(),
                    style: kresultTextStyle.copyWith(color: color),
                  ),
                  Text(
                    '$bmi',
                    style: kbmiTextStyle,
                  ),
                  Text(
                    '$advice',
                    textAlign: TextAlign.center,
                    style: kresultTextStyle.copyWith(color: color),
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            onTap: () {
              Navigator.pop(context);
            },
            buttonText: 'RE CALCULATE',
            navback: true,
          )
        ],
      ),
    );
  }
}
