import 'package:bmi_calculator/logic/calculator_brain.dart';
import 'package:bmi_calculator/views/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/gender.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import '../constants.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/round_icon.dart';
import '../logic/calculator_brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int userHeight = 200;
  int userAge = 18;
  int userWeight = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  //Male Card
                  child: ReusableCard(
                    state: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kReusableCardColor
                        : kInactiveCardColor,
                    cardChild: GenderCard(
                      gender: 'MALE',
                      cardIcon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
                Expanded(
                  //Female card
                  child: ReusableCard(
                    state: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kReusableCardColor
                        : kInactiveCardColor,
                    cardChild: GenderCard(
                      gender: 'FEMALE',
                      cardIcon: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            //Slider
            child: ReusableCard(
              colour: kInactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Height',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '$userHeight',
                        style: kNumberStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Color(0xffeb1555),
                      inactiveTrackColor: Color(0xff8d8e98),
                      activeTrackColor: Colors.white,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12),
                      overlayColor: Color(0x29eb1555),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 24),
                    ),
                    child: Slider(
                      value: userHeight.toDouble(),
                      min: 100,
                      max: 300,
                      onChanged: (value) {
                        setState(() {
                          userHeight = value.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kInactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          '$userWeight',
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundIconButton(
                              child: Icon(Icons.remove),
                              onPressed: () {
                                setState(() {
                                  userWeight--;
                                });
                              },
                            ),
                            RoundIconButton(
                              child: Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  userWeight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kInactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          '$userAge',
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundIconButton(
                              child: Icon(Icons.remove),
                              onPressed: () {
                                setState(() {
                                  userAge--;
                                });
                              },
                            ),
                            RoundIconButton(
                              child: Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  userAge++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            onTap: () {
              Map data = CalculatorBrain(height: userHeight, weight: userWeight)
                  .getResult();
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Result(
                          bmi: data['bmi'],
                          advice: data['advice'],
                          result: data['result'],
                          color: data['color'],
                        )),
              );
            },
            buttonText: 'CALCULATE',
            navback: false,
          ),
        ],
      ),
    );
  }
}
