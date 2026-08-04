import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final double width;
  final double height;
  final double borderRadius;
  final Color? borderColor;
  final Color buttonColor;
  final Color textColor;
  final double textSize;
  final bool isGradient;
  final List<Color>? gradientColors;
  final VoidCallback? onPressed;
  const CustomButton(
    {
      super.key,
      required this.buttonText,
      required this.width,
      required this.height,
      required this.borderRadius,
      this.borderColor,
      required this.buttonColor,
      required this.textColor,
      required this.textSize,
      this.isGradient = false,
      this.gradientColors,
      this.onPressed
    }
  );

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: width,
      height: height,
      child: isGradient ? gradientButton() : normalButton(),
    );
  }

  Widget normalButton() {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(borderRadius),
        ),
      ),
      child: Text(
        buttonText,
        style: TextStyle(
          color: textColor,
          fontSize: textSize,
        ),
      ),
    );
  }

  Widget gradientButton() {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors ??
              [Colors.blue, Colors.purple],
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(borderRadius),
          ),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            color: textColor,
            fontSize: textSize,
          ),
        ),
      ),
    );
  }
}