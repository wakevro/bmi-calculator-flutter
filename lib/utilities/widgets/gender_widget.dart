import 'package:bmicalculator/constants/pallete.dart';
import 'package:bmicalculator/constants/text_styling.dart';
import 'package:flutter/material.dart';

class GenderWidget extends StatefulWidget {
  const GenderWidget({
    super.key,
    required this.screenSize,
    required this.title,
    required this.angle,
    required this.color, required this.containerColor,
  });

  final Size screenSize;
  final String title;
  final double angle;
  final Color color;
  final Color containerColor;

  @override
  State<GenderWidget> createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: (widget.screenSize.height - 80) * 0.2,
      width: ((widget.screenSize.width - 60) / 2) - 10,
      decoration: BoxDecoration(
        color: widget.containerColor,
        borderRadius: BorderRadius.circular(15),
        border: const Border(
          top: BorderSide.none,
          bottom: BorderSide.none,
          left: BorderSide.none,
          right: BorderSide.none,
        ),
        boxShadow: const [
          BoxShadow(
              color: Pallete.darkMidColor, offset: Offset(5, 5), blurRadius: 25)
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Transform.rotate(
            angle: widget.angle,
            child: Image.asset(
              "assets/icons/gender.png",
              color: widget.color,
              height: 40,
            ),
          ),
          Text(
            widget.title,
            style: TStyle.bodyMedium.copyWith(
              color: widget.color,
            ),
          )
        ],
      ),
    );
  }
}
