import 'package:bmi_calculator/resuable_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './style.dart';
import './bmi_calculator.dart';

class ResultPage extends StatelessWidget {
  final String result;
  final String value;
  final String description;

  ResultPage(this.result, this.value, this.description);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
        brightness: Brightness.dark,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              child: Center(
                child: Text(
                  'Your Result',
                  style: kTitleTextStyle,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableWidget(
              col: inactiveCardColor,
              containerChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    result,
                    style: kResultTextStyle,
                  ),
                  Text(
                    value,
                    style: kBMI,
                  ),
                  Column(
                    children: [
                      Text(
                        'Normal BMI Range :',
                        style: kLabelTextStyle.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '18.5-25',
                        style: kLabelTextStyle.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    description,
                    textAlign: TextAlign.center,
                    style: kLabelTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              print('Re-Calculate button has been pressed');
              Navigator.pop(context);
            },
            child: Container(
              color: bottomColor,
              width: double.infinity,
              height: bottomCardHeight,
              margin: EdgeInsets.only(
                top: 10,
              ),
              child: Center(
                child: Text(
                  'RE-CALCULATE YOUR BMI',
                  style: kLabelTextStyle.copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
