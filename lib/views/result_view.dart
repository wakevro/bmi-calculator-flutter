import 'package:bmicalculator/constants/dimensions.dart';
import 'package:bmicalculator/constants/pallete.dart';
import 'package:bmicalculator/constants/text_styling.dart';
import 'package:bmicalculator/utilities/generics/calculator.dart';
import 'package:bmicalculator/utilities/generics/get_arguments.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ResultView extends StatelessWidget {
  const ResultView({super.key});

  @override
  Widget build(BuildContext context) {
    final resultMap = context.getArgument<Map>()!;

    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Pallete.whiteColor,
      body: Column(
        children: [
          // BACK ICON
          Container(
            padding: Dimension.bodyPadding,
            alignment: Alignment.topLeft,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.adaptive.arrow_back,
              ),
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: Dimension.bodyPadding.copyWith(top: 0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    // BMI METER
                    Container(
                      height: screenSize.height * 0.3,
                      width: screenSize.width - 20,
                      decoration: BoxDecoration(
                        color: Pallete.whiteColor,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                              color: Pallete.darkMidColor,
                              offset: Offset(5, 5),
                              blurRadius: 25)
                        ],
                      ),
                      child: Center(
                        child: SfRadialGauge(
                          axes: <RadialAxis>[
                            RadialAxis(
                              minimum: 8,
                              maximum: 43,
                              interval: 10,
                              canScaleToFit: true,
                              ranges: <GaugeRange>[
                                GaugeRange(
                                  startValue: 0,
                                  endValue: 12,
                                  color: Pallete.purpleColor,
                                ),
                                GaugeRange(
                                  startValue: 12,
                                  endValue: 18.5,
                                  color: Pallete.accentColor,
                                ),
                                GaugeRange(
                                  startValue: 18.5,
                                  endValue: 25,
                                  color: Pallete.greenColor,
                                ),
                                GaugeRange(
                                  startValue: 25,
                                  endValue: 30,
                                  color: Pallete.yellowColor,
                                ),
                                GaugeRange(
                                    startValue: 30,
                                    endValue: 35,
                                    color: Pallete.lighOrangeColor),
                                GaugeRange(
                                  startValue: 35,
                                  endValue: 40,
                                  color: Pallete.deepOrangeColor,
                                ),
                                GaugeRange(
                                  startValue: 40,
                                  endValue: 43,
                                  color: Pallete.redColor,
                                ),
                              ],
                              pointers: <GaugePointer>[
                                NeedlePointer(
                                  value: resultMap["bmi"],
                                  enableAnimation: true,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Your BMI is...",
                      style:
                          TStyle.heading2.copyWith(fontWeight: FontWeight.bold),
                    ),
                    // BMI
                    Text(
                      "${resultMap["bmi"]}",
                      style: TStyle.heading1.copyWith(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    // STATUS CONTAINER
                    IntrinsicWidth(
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        padding: Dimension.itemPadding,
                        decoration: BoxDecoration(
                          color: Calculator.getBmiText(resultMap["bmi"])[1],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            Calculator.getBmiText(resultMap["bmi"])[0],
                            style: TStyle.heading2.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Pallete.whiteColor),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "${resultMap["weightValue"]} lbs | ",
                            style: TStyle.bodyMedium.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Pallete.greyColor),
                          ),
                          TextSpan(
                            text:
                                "${Calculator.formatHeight(resultMap["heightValue"])[0]}'${Calculator.formatHeight(resultMap["heightValue"])[1]}'' | ",
                            style: TStyle.bodyMedium.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Pallete.greyColor),
                          ),
                          TextSpan(
                            text: "${resultMap["gender"]} | ",
                            style: TStyle.bodyMedium.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Pallete.greyColor),
                          ),
                          TextSpan(
                            text: "${resultMap["ageValue"]} years old",
                            style: TStyle.bodyMedium.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Pallete.greyColor),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    IntrinsicHeight(
                      child: Container(
                        width: screenSize.width - 20,
                        padding: Dimension.itemPadding,
                        decoration: BoxDecoration(
                          color: Pallete.lightColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(Calculator.bmiInfo(resultMap["bmi"])),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
