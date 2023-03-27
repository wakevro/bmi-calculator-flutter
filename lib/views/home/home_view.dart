import 'package:bmicalculator/constants/dimensions.dart';
import 'package:bmicalculator/constants/pallete.dart';
import 'package:bmicalculator/constants/text_styling.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Pallete.accentColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: Dimension.bodyPadding,
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
              SizedBox(
                width: screenSize.width - 60,
                child: Row(
                  children: [
                    Container(
                      height: (screenSize.height - 80) * 0.2,
                      width: ((screenSize.width - 60) / 2) - 10,
                      decoration: const BoxDecoration(
                        color: Pallete.greenColor,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: (screenSize.height - 80) * 0.2,
                      width: ((screenSize.width - 60) / 2) - 10,
                      decoration: const BoxDecoration(
                        color: Pallete.greenColor,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: screenSize.width - 60,
                child: Row(
                  children: [
                    SizedBox(
                      width: ((screenSize.width - 60) / 2) - 10,
                      child: Column(
                        children: [
                          Container(
                            color: Pallete.darkMidColor,
                            height: (screenSize.height - 80) * 0.2,
                            width: double.infinity,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            color: Pallete.darkMidColor,
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
                      color: Pallete.darkMidColor,
                      height: ((screenSize.height - 80) * 0.4) + 20,
                      width: ((screenSize.width - 60) / 2) - 10,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
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
}
