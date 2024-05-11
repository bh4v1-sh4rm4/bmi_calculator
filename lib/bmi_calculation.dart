import 'dart:math';

class BMICalculation {
BMICalculation ({required this.height, required this.weight});
  final int height;
  final int weight;

  double _bmi = 0;
  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25.0) {
      return "Over-Weight";
    } else if (_bmi >= 18.5 && _bmi < 25) {
      return "Normal";
    } else {
      return "Under-Weight";
    }
  }

  String getMessage() {
    if (_bmi >= 25.0) {
      return "You have higher than a normal body weight. Try exercising more to loose weight.";
    } else if (_bmi >= 18.5) {
      return "You have a normal body weight. Good Job!";
    } else {
      return "You have lower than a normal body weight. Try eating more to gain weight.";
    }
  }
}
