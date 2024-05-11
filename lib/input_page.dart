import 'package:bmi_calculator/bmi_calculation.dart';
import 'package:bmi_calculator/bottom_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/custom_round_button.dart';
import 'package:bmi_calculator/results_page.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:bmi_calculator/reusable_child_gender.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageSatate createState() => _InputPageSatate();
}

class _InputPageSatate extends State<InputPage> {
  Gender selectedGender = Gender.male;
  double heightSelected = minimumSelectedHeight;
  double weight = 55;

  int age = 14;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: ResuableCard(
                    cardPressed: () {
                      setState(() {
                        selectedGender = Gender.male;
                        heightSelected = minimumSelectedHeight;
                      });
                    },
                    cardColour: selectedGender == Gender.male
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: const ReusableChildGender(
                      genderString: "MALE",
                      genderIcon: FontAwesomeIcons.mars,
                    ),
                  )),
                  Expanded(
                      child: ResuableCard(
                    cardPressed: () {
                      setState(() {
                        selectedGender = Gender.female;
                        heightSelected = minimumSelectedHeight;
                        weight = 55;
                        age = 14;
                      });
                    },
                    cardColour: selectedGender == Gender.female
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: const ReusableChildGender(
                      genderString: "FEMALE",
                      genderIcon: FontAwesomeIcons.venus,
                    ),
                  )),
                ],
              ),
            ),
            Expanded(
                child: ResuableCard(
                    cardPressed: () {},
                    cardColour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "HEIGHT",
                          style: kLableTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              heightSelected.toInt().toString(),
                              style: kNumberTextStyle,
                            ),
                            const Text(
                              " cm",
                              style: kLableTextStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbColor: kBottomConatinerColour,
                            thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 12),
                            overlayShape: const RoundSliderOverlayShape(
                                overlayRadius: 25),
                            overlayColor: const Color(0x29EB1555),
                            activeTrackColor: Colors.white,
                          ),
                          child: Slider(
                            value: heightSelected.toDouble(),
                            min: minimumSelectedHeight,
                            max: maximumSelectedHeight,
                            onChanged: (double newHeight) {
                              setState(() {
                                heightSelected = newHeight.roundToDouble();
                              });
                            },
                          ),
                        ),
                      ],
                    ))),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: ResuableCard(
                          cardPressed: () {},
                          cardColour: kActiveCardColour,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "WEIGHT",
                                style: kLableTextStyle,
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Text(
                                      weight.toInt().toString(),
                                      style: kNumberTextStyle,
                                    ),
                                    const Text(
                                      "kg",
                                      style: kLableTextStyle,
                                    ),
                                  ]),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CustomRoundButton(
                                    icon: FontAwesomeIcons.minus,
                                    onPressed: () {
                                      setState(() {
                                        if (weight > 0) {
                                          weight -= 1;
                                        }
                                      });
                                    },
                                  ),
                                  const SizedBox(width: 10),
                                  CustomRoundButton(
                                    icon: FontAwesomeIcons.plus,
                                    onPressed: () {
                                      setState(() {
                                        weight += 1;
                                      });
                                    },
                                  ),
                                ],
                              )
                            ],
                          ))),
                  Expanded(
                      child: ResuableCard(
                          cardPressed: () {},
                          cardColour: kActiveCardColour,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "AGE",
                                style: kLableTextStyle,
                              ),
                              Text(
                                age.toString(),
                                style: kNumberTextStyle,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CustomRoundButton(
                                    icon: FontAwesomeIcons.minus,
                                    onPressed: () {
                                      setState(() {
                                        if (age > 0) {
                                          age -= 1;
                                        }
                                      });
                                    },
                                  ),
                                  const SizedBox(width: 10),
                                  CustomRoundButton(
                                    icon: FontAwesomeIcons.plus,
                                    onPressed: () {
                                      setState(() {
                                        age += 1;
                                      });
                                    },
                                  ),
                                ],
                              )
                            ],
                          )))
                ],
              ),
            ),
            BottomButton(
                titleText: "CALCULATE YOUR BMI!",
                onTap: () {
                  BMICalculation calculation = BMICalculation(
                      height: heightSelected.toInt(), weight: weight.toInt());

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultPage(
                                bmiValue: calculation.calculateBMI(),
                                bmiResult: calculation.getResult(),
                                message: calculation.getMessage(),
                              )));
                }),
          ],
        ),
      ),
    );
  }
}
