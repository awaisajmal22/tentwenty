import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:tentwenty_test/config/extensions/height_width_extension.dart';
import 'package:tentwenty_test/core/colors/color_palette.dart';
import 'package:tentwenty_test/gen/assets.gen.dart';
import 'package:tentwenty_test/utils/app_text.dart';

customAppBar({required BuildContext context, required String title,required String date}){
  return AppBar(
        centerTitle: true,
        title: Column(
          children: [
            appText(
                context: context,
                text: title,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: ColorPalette.darkblue),
            appText(
                context: context,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                text:
                    'In Theaters ${DateFormat('MMMM dd, yyyy').format(DateTime.parse(date))}',
                color: ColorPalette.blue),
          ],
        ),
        leadingWidth: 50,
        leading: Row(
          children: [
            context.widthBox(0.02),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: SvgPicture.asset(
                Assets.icons.back,
                height: 30,
                width: 30,
                color: Colors.black,
              ),
            ),
          ],
        ),
      );
}