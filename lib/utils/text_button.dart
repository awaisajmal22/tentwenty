import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tentwenty_test/config/extensions/height_width_extension.dart';
import 'package:tentwenty_test/core/colors/color_palette.dart';
import 'package:tentwenty_test/utils/app_text.dart';

textButton({
  required BuildContext context,
  required VoidCallback onTap,
  required String title,
  Color textColor = ColorPalette.white,
  double fontSize = 14,
  FontWeight fontWeight = FontWeight.w600,
  double radius = 10,
  Color bgColor = ColorPalette.blue,
  Color borderColor = ColorPalette.blue,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: bgColor,
        border: Border.all(
          color: borderColor,
        ),
        borderRadius: BorderRadius.circular(radius),
      ),
      child: appText(
          context: context,
          text: title,
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor),
    ),
  );
}

iconButton({
  required BuildContext context,
  required VoidCallback onTap,
  required String title,
  Color textColor = ColorPalette.white,
  double fontSize = 14,
  FontWeight fontWeight = FontWeight.w600,
  double radius = 10,
  Color bgColor = ColorPalette.blue,
  IconData icon = Icons.play_arrow,
  Color borderColor = ColorPalette.blue,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: bgColor,
        border: Border.all(
          color: borderColor,
        ),
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: ColorPalette.white,
          ),
          context.widthBox(0.01),
          appText(
              context: context,
              text: title,
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: textColor)
        ],
      ),
    ),
  );
}
