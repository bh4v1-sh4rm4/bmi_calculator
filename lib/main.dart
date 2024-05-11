import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.blueGrey, accentColor: kInactiveCardColour),
          scaffoldBackgroundColor: const Color.fromARGB(255, 84, 109, 153)),
      home: const InputPage(),
    );
  }
}
