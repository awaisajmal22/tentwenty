
  import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tentwenty_test/config/extensions/height_width_extension.dart';
import 'package:tentwenty_test/config/extensions/size_extension.dart';
import 'package:tentwenty_test/core/colors/color_palette.dart';
import 'package:tentwenty_test/data/model/tickets_model/tickets_model.dart';
import 'package:tentwenty_test/gen/assets.gen.dart';
import 'package:tentwenty_test/gen/fonts.gen.dart';
import 'package:tentwenty_test/utils/app_text.dart';

typedef OnTap =Function(int);
  Widget hallWidget({required BuildContext context,required Hall hall,required int selectedHall,required int index,required OnTap onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              appText(
                context: context,
                text: hall.time,
                color: ColorPalette.darkblue,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              context.widthBox(0.01),
              appText(
                context: context,
                text: hall.title,
                color: ColorPalette.darkgrey,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              )
            ],
          ),
          context.heightBox(0.01),
          GestureDetector(
            onTap: (){
              onTap(index);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                  vertical: 20, horizontal: 30),
              width: context.getSize.width * 0.7,
              height: context.getSize.height * 0.2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 4,
                        offset: Offset(0, 1))
                  ],
                  border: Border.all(
                    color: selectedHall == index
                        ? ColorPalette.blue
                        : Colors.white,
                  )),
              child: Center(
                child: Assets.images.slot.image(fit: BoxFit.cover),
              ),
            ),
          ),
          context.heightBox(0.02),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: 'From ',
                style: const TextStyle(
                  fontFamily: FontFamily.poppins,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: ColorPalette.darkgrey,
                )),
            TextSpan(
                text: hall.price,
                style: const TextStyle(
                  fontFamily: FontFamily.poppins,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: ColorPalette.darkblue,
                )),
            TextSpan(
                text: ' or ',
                style: const TextStyle(
                  fontFamily: FontFamily.poppins,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: ColorPalette.darkgrey,
                )),
            TextSpan(
                text: '${hall.bounce} bounces',
                style: const TextStyle(
                  fontFamily: FontFamily.poppins,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: ColorPalette.darkblue,
                ))
          ]))
        ],
      ),
    );
  }