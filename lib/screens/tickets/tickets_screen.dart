import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:tentwenty_test/config/extensions/height_width_extension.dart';
import 'package:tentwenty_test/config/extensions/size_extension.dart';
import 'package:tentwenty_test/config/router/routes.dart';
import 'package:tentwenty_test/core/colors/color_palette.dart';
import 'package:tentwenty_test/core/constant/constant.dart';
import 'package:tentwenty_test/data/detail_model/detail_model.dart';
import 'package:tentwenty_test/data/model/tickets_model/tickets_model.dart';
import 'package:tentwenty_test/gen/assets.gen.dart';
import 'package:tentwenty_test/gen/fonts.gen.dart';
import 'package:tentwenty_test/screens/tickets/component/hall_widget.dart';
import 'package:tentwenty_test/utils/app_text.dart';
import 'package:tentwenty_test/utils/custom_appbar.dart';
import 'package:tentwenty_test/utils/text_button.dart';

class TicketsScreen extends HookWidget {
  final DetailModel model;
  TicketsScreen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final _selectedIndex = useState<int>(0);
    final _selectedHall = useState<int>(0);
    changeIndex(int index) {
      _selectedIndex.value = index;
    }

    changeHall(int index) {
      _selectedHall.value = index;
    }

    final _selectSeat = useState<bool>(false);
    changeSelectSeat() {
      _selectSeat.value = !_selectSeat.value;
    }

    return Scaffold(
      appBar: customAppBar(
          context: context,
          title: model.title!,
          date: model.releaseDate.toString()),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: appText(
                  context: context,
                  text: 'Date',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: ColorPalette.darkblue),
            ),
          ),
          context.heightBox(0.01),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: List.generate(Constant.tickList.length, (index) {
                return GestureDetector(
                  onTap: () {
                    changeIndex(index);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    margin: const EdgeInsets.symmetric(horizontal: 7),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: _selectedIndex.value == index
                            ? ColorPalette.blue
                            : ColorPalette.grey),
                    child: appText(
                        context: context,
                        text: Constant.tickList[index].date,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: _selectedIndex.value == index
                            ? ColorPalette.white
                            : ColorPalette.darkblue),
                  ),
                );
              }),
            ),
          ),
          context.heightBox(0.03),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                  Constant.tickList[_selectedIndex.value].hall.length, (index) {
                Hall hall = Constant.tickList[_selectedIndex.value].hall[index];
                return hallWidget(
                    onTap: (v) {
                      changeHall(index);
                    },
                    context: context,
                    hall: hall,
                    selectedHall: _selectedHall.value,
                    index: index);
              }),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: textButton(
                context: context,
                onTap: () {
                  Navigator.pushNamed(context, Routes.selectseat,
                      arguments: model);
                },
                title: 'Select Seats'),
          ),
          context.heightBox(0.03),
        ],
      ),
    );
  }
}
