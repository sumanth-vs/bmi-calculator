import 'dart:math';
import 'package:flutter/material.dart';

class CalculatorBrain {
  final int height;
  final int weight;

  double _bmi;

  CalculatorBrain({this.height, this.weight});

  Map getResult() {
    _bmi = weight / (pow(height / 100, 2));
    String _bmiString = _bmi.toStringAsFixed(1);

    if (_bmi >= 25)
      return {
        'bmi': _bmiString,
        'result': 'Overweight',
        'advice': 'Start Dieting!',
        'color': Color(0xffeb1555),
      };
    else if (_bmi >= 18.5)
      return {
        'bmi': _bmiString,
        'result': 'Normal',
        'advice': 'Maintain This Health!',
        'color': Colors.green,
      };
    else
      return {
        'bmi': _bmiString,
        'result': 'Underweight',
        'advice': 'Start Eating More!',
        'color': Color(0xffeb1555),
      };
  }
}
