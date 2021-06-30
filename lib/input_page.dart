import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './resuable_widget.dart';
import './row1.dart';
import './style.dart';
import './result_page.dart';
import './bmi_calculator.dart';

enum Gender {
  Male,
  Female,
}

class InputPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
        brightness: Brightness.dark,
      ),
      body: CardPage(),
    );
  }
}

class CardPage extends StatefulWidget {
  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  Gender? selectedGender;

  Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;
  int height = 160;
  int weight = 50;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.Male;
                    });
                  },
                  child: ReusableWidget(
                    col: (selectedGender == Gender.Male)
                        ? activeCardColor
                        : inactiveCardColor,
                    containerChild: Row1(FontAwesomeIcons.mars, 'MALE'),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.Female;
                    });
                  },
                  child: ReusableWidget(
                      col: (selectedGender == Gender.Female)
                          ? activeCardColor
                          : inactiveCardColor,
                      containerChild: Row1(FontAwesomeIcons.venus, 'FEMALE')),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ReusableWidget(
            col: inactiveCardColor,
            containerChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Height', style: kLabelTextStyle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(height.toString(), style: kNumberStyle),
                    Text('cm'),
                  ],
                ),
                Slider(
                  activeColor: bottomColor,
                  inactiveColor: Color(0xFF8D8E98),
                  value: height.toDouble(),
                  min: 120,
                  max: 240,
                  onChanged: (double newValue) {
                    setState(() {
                      height = newValue.round();
                    });
                  },
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: ReusableWidget(
                  col: inactiveCardColor,
                  containerChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'WEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            weight.toString(),
                            style: kNumberStyle,
                          ),
                          Text('kg')
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MaterialButton(FontAwesomeIcons.minus, () {
                            setState(() {
                              print('Decrement weight working');
                              weight--;
                            });
                          }),
                          MaterialButton(FontAwesomeIcons.plus, () {
                            setState(() {
                              print('Increment Age working');
                              weight++;
                            });
                          }),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableWidget(
                  col: inactiveCardColor,
                  containerChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'AGE',
                        style: kLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            age.toString(),
                            style: kNumberStyle,
                          ),
                          Text('yrs')
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MaterialButton(FontAwesomeIcons.minus, () {
                            setState(() {
                              print('Decrement Age working');
                              age--;
                            });
                          }),
                          MaterialButton(FontAwesomeIcons.plus, () {
                            setState(() {
                              print('Increment Age working');
                              age++;
                            });
                          }),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            print('Calculate button has been pressed');
            BmiCalculator calc = BmiCalculator(weight, height);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResultPage(
                  calc.BmiResult().toUpperCase(),
                  calc.BmiValue(),
                  calc.BmiDescription(),
                ),
              ),
            );
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
                'CALCULATE YOUR BMI',
                style: kLabelTextStyle.copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MaterialButton extends StatelessWidget {
  IconData? ico;
  final Function pressedEvent;

  MaterialButton(this.ico, this.pressedEvent);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        pressedEvent();
      },
      elevation: 7,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      child: Icon(
        ico,
        color: Colors.white,
      ),
    );
  }
}
