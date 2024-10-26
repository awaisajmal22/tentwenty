import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tentwenty_test/config/extensions/size_extension.dart';
import 'package:tentwenty_test/config/router/routes.dart';
import 'package:tentwenty_test/core/colors/color_palette.dart';
import 'package:tentwenty_test/core/constant/constant.dart';
import 'package:tentwenty_test/utils/app_text.dart';

watchWidget(
    {required BuildContext context,
    required String image,
    required String movieId,
    required String title}) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, Routes.detail, arguments: movieId);
    },
    child: Container(
      margin: const EdgeInsets.only(bottom: 20),
      height: context.getSize.height * 0.22,
      width: context.getSize.width,
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: NetworkImage(
                "${Constant.imageUrl}/$movieId$image?api_key=${Constant.apiKey}",
              ),
              fit: BoxFit.fill)),
      child: Container(
        height: context.getSize.height * 0.1,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black.withOpacity(0.0), Colors.black])),
        width: context.getSize.width,
        child: appText(
            context: context,
            text: title,
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: ColorPalette.white),
      ),
    ),
  );
}
