import 'package:bmicalculator/constants/dimensions.dart';
import 'package:bmicalculator/constants/pallete.dart';
import 'package:bmicalculator/constants/text_styling.dart';
import 'package:bmicalculator/utilities/widgets/gender_widget.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Pallete.lightColor,
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
                      style: TStyle.heading1,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Expanded(
                      child: Text(
                        "Body Mass Index, is a measurement that uses an individual's height and weight to estimate their level of body fat and potential health risks.",
                        style: TStyle.bodyExtraSmall,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              // GENDER WIDGETS
              SizedBox(
                width: screenSize.width - 60,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
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
                          Container(
                            color: Pallete.whiteColor,
                            height: (screenSize.height - 80) * 0.2,
                            width: double.infinity,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            color: Pallete.whiteColor,
                            height: (screenSize.height - 80) * 0.2,
                            width: double.infinity,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      color: Pallete.whiteColor,
                      height: ((screenSize.height - 80) * 0.4) + 20,
                      width: ((screenSize.width - 60) / 2) - 10,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),

              // HEIGHT RULER
              Container(
                width: double.infinity,
                height: 50,
                color: Pallete.purpleColor,
                child: TextButton(
                  child: const Text("Calculate"),
                  onPressed: () {},
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
}
