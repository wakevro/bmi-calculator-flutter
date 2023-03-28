import 'package:bmicalculator/constants/dimensions.dart';
import 'package:bmicalculator/constants/pallete.dart';
import 'package:bmicalculator/constants/text_styling.dart';
import 'package:flutter/material.dart';

class ResultView extends StatelessWidget {
  const ResultView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Pallete.whiteColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: Dimension.bodyPadding,
          child: Column(
            children: [
              // BACK ICON
              Container(
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
              const SizedBox(
                height: 50,
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
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Your BMI is...",
                style: TStyle.heading2.copyWith(fontWeight: FontWeight.bold),
              ),
              // BMI
              Text(
                "20.4",
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
                    color: Pallete.greenColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "Normal",
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
                      text: "60.1 kg | ",
                      style: TStyle.bodyMedium.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Pallete.greyColor),
                    ),
                    TextSpan(
                      text: "60.1 kg | ",
                      style: TStyle.bodyMedium.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Pallete.greyColor),
                    ),
                    TextSpan(
                      text: "60.1 kg | ",
                      style: TStyle.bodyMedium.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Pallete.greyColor),
                    ),
                    TextSpan(
                      text: "60.1 kg",
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
                  child: const Text(
                      "Great news! Your BMI of 22.5 falls within the normal range, indicating a healthy body weight. Maintaining healthy habits like a balanced diet, exercise, and sleep can reduce the risk of chronic diseases. Remember, BMI is only one measure of health, so consult your doctor or a dietitian for personalized advice."),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
