import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tentwenty_test/config/extensions/height_width_extension.dart';
import 'package:tentwenty_test/config/extensions/size_extension.dart';
import 'package:tentwenty_test/core/colors/color_palette.dart';
import 'package:tentwenty_test/core/constant/constant.dart';
import 'package:tentwenty_test/data/detail_model/detail_model.dart';
import 'package:tentwenty_test/screens/select_seat/component/select_seat_grid.dart';
import 'package:tentwenty_test/utils/app_text.dart';
import 'package:tentwenty_test/utils/custom_appbar.dart';
import 'package:tentwenty_test/utils/text_button.dart';

class SelectSeatScreen extends HookWidget {
  final DetailModel model;
  const SelectSeatScreen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final _zoom = useState<double>(1);
    return Scaffold(
      appBar: customAppBar(
          context: context,
          title: model.title!,
          date: model.releaseDate.toString()),
      body: Column(
        children: [
          context.heightBox(0.07),
          SizedBox(
            height: context.getSize.height * 0.37,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    context.widthBox(0.01),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          context.heightBox(0.075),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Text(
                                '${index + 1}.',
                                style: TextStyle(fontSize: 10),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: context.getSize.height * 0.37,
                      width: context.getSize.width * 0.9,
                      padding: const EdgeInsets.only(top: 10),
                      decoration: const BoxDecoration(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(60)),
                          border: Border(
                              top: BorderSide(color: ColorPalette.blue))),
                      child: appText(
                          context: context,
                          text: 'SCREEN',
                          color: ColorPalette.darkgrey,
                          fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(
                  height: context.getSize.height * 0.3,
                  width: context.getSize.width * 0.9,
                  child: InteractiveViewer(
                      minScale: 1,
                      maxScale: 3.0,
                      child: Transform.scale(
                          scale: _zoom.value, child: ChairGrid())),
                ),
                Positioned(
                    right: 20,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _zoom.value += 0.1;
                            print(_zoom.value);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorPalette.white),
                            child: Icon(Icons.add),
                          ),
                        ),
                        context.widthBox(0.01),
                        GestureDetector(
                          onTap: () {
                            _zoom.value -= 0.1;
                          },
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorPalette.white),
                            child: Icon(Icons.remove),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
          context.heightBox(0.02),
          Wrap(
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.start,
              spacing: 7,
              runSpacing: 7,
              children: List.generate(Constant.chairType.length, (index) {
                ChairType chairType = Constant.chairType[index];
                return SizedBox(
                  width: context.getSize.width * 0.4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.chair,
                        color: chairType.color,
                        size: 20,
                      ),
                      context.widthBox(0.01),
                      appText(
                          context: context,
                          text: chairType.title,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: ColorPalette.darkgrey)
                    ],
                  ),
                );
              })),
          context.heightBox(0.02),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                  color: ColorPalette.grey,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  appText(
                      context: context,
                      text: '4/3',
                      color: ColorPalette.darkblue,
                      fontSize: 10,
                      fontWeight: FontWeight.w400),
                  context.widthBox(0.01),
                  const Icon(
                    Icons.close,
                    size: 12,
                    color: ColorPalette.darkblue,
                  )
                ],
              ),
            ),
          ),
          context.heightBox(0.03),
          Row(
            children: [
              context.widthBox(0.02),
              Container(
                alignment: Alignment.centerLeft,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                decoration: BoxDecoration(
                    color: ColorPalette.grey,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    appText(
                      context: context,
                      text: 'Total Price',
                      fontSize: 10,
                      color: ColorPalette.darkblue,
                      fontWeight: FontWeight.w400,
                    ),
                    appText(
                      context: context,
                      text: '\$50',
                      fontSize: 16,
                      color: ColorPalette.darkblue,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
              context.widthBox(0.01),
              Expanded(
                  child: textButton(
                      context: context, onTap: () {}, title: 'Proceed to pay')),
              context.widthBox(0.02),
            ],
          )
        ],
      ),
    );
  }
}
