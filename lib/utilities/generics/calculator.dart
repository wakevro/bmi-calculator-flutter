import 'package:bmicalculator/constants/bmi_info.dart';
import 'package:bmicalculator/constants/pallete.dart';

class Calculator {
  static List<int> formatHeight(int cm) {
    int totalInches = (cm / 2.54).round();
    int feet = (totalInches / 12).floor();
    int inches = totalInches % 12;
    return [feet, inches];
  }

  static List getBmiText(double bmi) {
    if (bmi <= 18.5) {
      return ["Underweight", Pallete.purpleColor];
    } else if (bmi > 18.5 && bmi <= 24.9) {
      return ["Normal", Pallete.greenColor];
    } else if (bmi > 24.9 && bmi <= 29.9) {
      return ["Overweight", Pallete.lighOrangeColor];
    } else {
      return ["Obese", Pallete.redColor];
    }
  }

  static String bmiInfo(double bmi) {
    if (bmi <= 18.5) {
      return underweightInfoText;
    } else if (bmi > 18.5 && bmi <= 24.9) {
      return normalInfoText;
    } else if (bmi > 24.9 && bmi <= 29.9) {
      return overweightInfoText;
    } else {
      return obeseInfoText;
    }
  }
}
