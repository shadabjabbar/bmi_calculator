import 'dart:math';

import 'package:flutter/material.dart';
import './style.dart';

class BmiCalculator {
  final int weight;
  final int height;
  String? result;
  double? _bmi;

  BmiCalculator(this.weight, this.height) {
    _bmi = weight / pow(height / 100, 2);

    print(result);
  }

  String BmiResult() {
    if (_bmi! >= 25)
      return 'Overweight';
    else if (_bmi! >= 18.5)
      return 'Normal';
    else
      return 'Underweight';
  }
  String BmiValue() {
    return _bmi!.toStringAsFixed(1);
  }

  String BmiDescription(){
    if (_bmi! >= 25)
      return 'Your BMI is quite High, you should eat less';
    else if (_bmi! >= 18.5)
      return 'Your BMI is Normal, you should not worry';
    else
      return 'Your BMi is quite Low, you should eat more';
  }

}

