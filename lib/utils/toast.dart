import 'package:flutter/material.dart';


import 'package:tentwenty_test/core/colors/color_palette.dart';
import 'package:tentwenty_test/utils/app_text.dart';

toast({required String msg, required BuildContext context, int maxline = 1}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: ColorPalette.darkblue,
      content: appText(
        context: context,
        text: msg,
        color: ColorPalette.white,
        fontSize: 13,
        fontWeight: FontWeight.w400,
      )));
}
