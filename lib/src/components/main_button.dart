import 'package:flutter/material.dart';
import 'package:flutter_test_users/src/theme/Colors.dart';
import 'package:flutter_test_users/src/theme/fonts.dart';

class MainButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  const MainButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.color = AppColors.primaryColor,
      this.textColor = AppColors.secondaryColor});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      fillColor: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Text(text, style: AppFonts.bodyBold.copyWith(color: textColor))),
    );
  }
}
