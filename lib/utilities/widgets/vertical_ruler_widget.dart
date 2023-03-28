import 'package:bmicalculator/constants/pallete.dart';
import 'package:bmicalculator/constants/text_styling.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ruler_picker/flutter_ruler_picker.dart';

typedef Callback = void Function(int value);

class VerticalRulerWidget extends StatelessWidget {
  const VerticalRulerWidget({
    super.key,
    required this.screenSize,
    required this.rulerValue,
    required this.rulerPickerController,
    required this.changeValue,
    required this.title,
    required this.subtitle,
    required this.onSubmittedValue,
  });

  final Size screenSize;
  final int rulerValue;
  final RulerPickerController? rulerPickerController;
  final Callback changeValue;
  final Callback onSubmittedValue;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController = TextEditingController();
    textEditingController.text = rulerValue.toString();
    textEditingController.selection =
        TextSelection.collapsed(offset: textEditingController.text.length);
    return Container(
        height: ((screenSize.height - 80) * 0.4) + 20,
        width: ((screenSize.width - 60) / 2) - 10,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 5,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: title,
                    style: TStyle.bodyMedium.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Pallete.darkColor),
                  ),
                  TextSpan(
                    text: subtitle,
                    style: TStyle.bodyMedium
                        .copyWith(fontSize: 14, color: Pallete.darkMidColor),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: ((screenSize.height - 80) * 0.4) - 40,
                  width: (((screenSize.width - 90) / 2) - 20) / 2,
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IntrinsicWidth(
                          child: CupertinoTextField(
                            controller: textEditingController,
                            keyboardType: const TextInputType.numberWithOptions(
                                signed: true, decimal: true),
                            onSubmitted: (value) {
                              onSubmittedValue(int.parse(value));
                            },
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "${formatHeight(rulerValue)[0]}'",
                                style: TStyle.bodyMedium.copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Pallete.darkColor),
                              ),
                              TextSpan(
                                text: "${formatHeight(rulerValue)[1]}'",
                                style: TStyle.bodyMedium.copyWith(
                                    fontSize: 16, color: Pallete.darkColor),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                SizedBox(
                  height: ((screenSize.height - 80) * 0.4) - 38,
                  width: (((screenSize.width - 40) / 2) - 20) / 2,
                  child: Align(
                    alignment: Alignment.center,
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: LayoutBuilder(
                        builder: (p0, p1) {
                          return SizedBox(
                            width: double.infinity - 20,
                            child: RulerPicker(
                              rulerBackgroundColor: Colors.transparent,
                              controller: rulerPickerController!,
                              beginValue: 30,
                              endValue: 240,
                              initValue: rulerValue,
                              scaleLineStyleList: const [
                                ScaleLineStyle(
                                    color: Pallete.darkColor,
                                    width: 1.5,
                                    height: 35,
                                    scale: 0),
                                ScaleLineStyle(
                                    color: Pallete.darkMidColor,
                                    width: 1,
                                    height: 30,
                                    scale: 5),
                                ScaleLineStyle(
                                    color: Pallete.greyColor,
                                    width: 1,
                                    height: 20,
                                    scale: -1)
                              ],
                              onValueChange: (value) {
                                changeValue(value);
                              },
                              width: ((screenSize.height - 80) * 0.4) - 40,
                              height: (screenSize.height - 80) * 0.07,
                              rulerMarginTop: 15,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}

List<int> formatHeight(int cm) {
  int totalInches = (cm / 2.54).round();
  int feet = (totalInches / 12).floor();
  int inches = totalInches % 12;
  return [feet, inches];
}
