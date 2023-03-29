import 'package:bmicalculator/constants/dimensions.dart';
import 'package:bmicalculator/constants/pallete.dart';
import 'package:bmicalculator/constants/text_styling.dart';
import 'package:bmicalculator/router/routes.dart';
import 'package:bmicalculator/utilities/widgets/gender_widget.dart';
import 'package:bmicalculator/utilities/widgets/horizontal_ruler_widget.dart';
import 'package:bmicalculator/utilities/widgets/vertical_ruler_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ruler_picker/flutter_ruler_picker.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Color maleColor = Pallete.darkColor;
  Color femaleColor = Pallete.greyColor;
  Color containerMaleColor = Pallete.whiteColor;
  Color containerFemaleColor = Pallete.whiteColor;

  RulerPickerController? _weightRulerPickerController;
  RulerPickerController? _ageRulerPickerController;
  RulerPickerController? _heightRulerPickerController;

  String gender = "Male";
  int weightValue = 150;
  int ageValue = 25;
  int heightValue = 175;
  @override
  void initState() {
    super.initState();
    _weightRulerPickerController = RulerPickerController(value: 0);
    _ageRulerPickerController = RulerPickerController(value: 0);
    _heightRulerPickerController = RulerPickerController(value: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _weightRulerPickerController?.dispose();
    _ageRulerPickerController?.dispose();
    _heightRulerPickerController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Pallete.whiteColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: Dimension.bodyPadding,

          // HEADER
          child: Column(
            children: [
              SizedBox(
                height: (screenSize.height - 80) * 0.13,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "BMI Calculator",
                      style:
                          TStyle.heading1.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
              // GENDER WIDGETS
              SizedBox(
                width: screenSize.width - 60,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        gender = "Male";
                        if (maleColor != Pallete.darkColor) {
                          _switchColor();
                        }
                      },
                      onTapDown: (details) {
                        setState(() {
                          containerMaleColor = Pallete.lightColor;
                        });
                      },
                      onTapUp: (details) {
                        setState(() {
                          containerMaleColor = Pallete.whiteColor;
                        });
                      },
                      child: GenderWidget(
                        screenSize: screenSize,
                        title: "Male",
                        angle: 3.8,
                        color: maleColor,
                        containerColor: containerMaleColor,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () async {
                        gender = "Female";
                        if (femaleColor != Pallete.darkColor) {
                          _switchColor();
                        }
                      },
                      onTapDown: (details) {
                        setState(() {
                          containerFemaleColor = Pallete.lightColor;
                        });
                      },
                      onTapUp: (details) {
                        setState(() {
                          containerFemaleColor = Pallete.whiteColor;
                        });
                      },
                      child: GenderWidget(
                        screenSize: screenSize,
                        title: "Female",
                        angle: 0.6,
                        color: femaleColor,
                        containerColor: containerFemaleColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              // WEIGHT AND AGE
              SizedBox(
                width: screenSize.width - 60,
                child: Row(
                  children: [
                    SizedBox(
                      width: ((screenSize.width - 60) / 2) - 10,
                      child: Column(
                        children: [
                          HorizontalRulerWidget(
                            screenSize: screenSize,
                            rulerValue: weightValue,
                            rulerPickerController: _weightRulerPickerController,
                            changeValue: (int value) {
                              setState(() {
                                weightValue = value;
                              });
                            },
                            title: "Weight  ",
                            subtitle: "(lbs)",
                            onSubmittedValue: (int value) {
                              _weightRulerPickerController!.value = value;
                            },
                            startValue: 0,
                            endValue: 450,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          HorizontalRulerWidget(
                            screenSize: screenSize,
                            rulerValue: ageValue,
                            rulerPickerController: _ageRulerPickerController,
                            changeValue: (int value) {
                              setState(() {
                                ageValue = value;
                              });
                            },
                            title: "Age",
                            subtitle: "",
                            onSubmittedValue: (int value) {
                              setState(() {
                                _ageRulerPickerController!.value = value;
                              });
                            },
                            startValue: 1,
                            endValue: 100,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),

                    // HEIGHT RULER
                    VerticalRulerWidget(
                      screenSize: screenSize,
                      rulerValue: heightValue,
                      rulerPickerController: _heightRulerPickerController,
                      changeValue: (int value) {
                        setState(() {
                          heightValue = value;
                        });
                      },
                      title: "Height  ",
                      subtitle: "(cm/ft)",
                      onSubmittedValue: (int value) {
                        _heightRulerPickerController!.value = value;
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),

              // CALCULATE BUTTON
              TextButton(
                onPressed: () {
                  final double bmi =
                      calculateBmi(ageValue, weightValue, heightValue, gender);
                  Navigator.of(context).pushNamed(resultRoute, arguments: {
                    "bmi": bmi,
                    "weightValue": weightValue,
                    "heightValue": heightValue,
                    "gender": gender,
                    "ageValue": ageValue
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Pallete.darkColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  elevation: MaterialStateProperty.all(10),
                  minimumSize: MaterialStateProperty.all(
                      const Size(double.infinity, 50)),
                ),
                child: Text(
                  "Calculate",
                  style:
                      TStyle.accentButton.copyWith(color: Pallete.whiteColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _switchColor() {
    return setState(() {
      maleColor = maleColor == Pallete.greyColor
          ? Pallete.darkColor
          : Pallete.greyColor;
      femaleColor = maleColor == Pallete.greyColor
          ? Pallete.darkColor
          : Pallete.greyColor;
    });
  }

  double calculateBmi(
      int ageValue, int weightValue, int heightValue, String gender) {
    double height = heightValue / 100.0;
    double weight = weightValue * 0.45359237;
    double bmi = weight / (height * height);
    if (gender.toLowerCase() == "female") {
      bmi *= 0.9;
    }
    if (ageValue > 20) {
      bmi += ((ageValue - 20) / 10.0) * 0.2;
    }
    bmi = double.parse(bmi.toStringAsFixed(1));

    return bmi;
  }
}
