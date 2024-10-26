import 'package:flutter/material.dart';
import 'package:tentwenty_test/config/extensions/font_extension.dart';
import 'package:tentwenty_test/gen/fonts.gen.dart';


appText(
    {required BuildContext context,
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.normal,
    required String text,
    int maxLines = 2,
    TextAlign align = TextAlign.center,
    Color color = Colors.white}) {
  return Text(
    text,
    textAlign: align,
    maxLines: maxLines,
    style: TextStyle(
      
      fontFamily: FontFamily.poppins,
      fontSize: context.font(fontSize),
      fontWeight: fontWeight,
      color: color,
    ),
  );
}
