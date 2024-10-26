import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tentwenty_test/config/extensions/height_width_extension.dart';
import 'package:tentwenty_test/config/extensions/size_extension.dart';
import 'package:tentwenty_test/core/bloc/watch_bloc/watch_bloc.dart';
import 'package:tentwenty_test/core/bloc/watch_bloc/watch_event.dart';
import 'package:tentwenty_test/core/bloc/watch_bloc/watch_state.dart';
import 'package:tentwenty_test/core/colors/color_palette.dart';
import 'package:tentwenty_test/data/model/navbar/navbar_model.dart';
import 'package:tentwenty_test/gen/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tentwenty_test/main.dart';
import 'package:tentwenty_test/screens/watch/component/watch_widget.dart';
import 'package:tentwenty_test/screens/watch/watch_screen.dart';
import 'package:tentwenty_test/utils/app_text.dart';
import 'package:tentwenty_test/utils/loader/loading.dart';

class DashboardScreen extends HookWidget {
  DashboardScreen({super.key});
  List<NavbarModel> navBar = <NavbarModel>[
    NavbarModel(icon: Assets.icons.dash, name: 'Dashbaord'),
    NavbarModel(icon: Assets.icons.watch, name: 'Watch'),
    NavbarModel(icon: Assets.icons.library, name: 'Media Library'),
    NavbarModel(icon: Assets.icons.list, name: 'More'),
  ];
  @override
  Widget build(BuildContext context) {
    final _selectedIndex = useState<int>(1);
    onChange(int index) {
      _selectedIndex.value = index;
    }



    return Scaffold(
      appBar: _appBar(_selectedIndex.value, context),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          _body(_selectedIndex.value, context),
          
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15),
            width: context.getSize.width,
            decoration: const BoxDecoration(
                color: ColorPalette.darkblue,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(27),
                    topRight: Radius.circular(27))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(navBar.length, (index) {
                return GestureDetector(
                  onTap: () {
                    onChange(index);
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        navBar[index].icon,
                        color: _selectedIndex.value == index
                            ? ColorPalette.white
                            : ColorPalette.white.withOpacity(0.54),
                      ),
                      context.heightBox(0.01),
                      appText(
                          context: context,
                          text: navBar[index].name,
                          fontSize: 10,
                          color: _selectedIndex.value == index
                              ? ColorPalette.white
                              : ColorPalette.white.withOpacity(0.54),
                          fontWeight: _selectedIndex.value == index
                              ? FontWeight.w700
                              : FontWeight.w400)
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  _appBar(int index, BuildContext context) {
    switch (index) {
      case 0:
        return AppBar();
      case 1:
        return AppBar(
          title: appText(
              context: context,
              text: "Watch",
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: ColorPalette.darkblue),
        );
      case 2:
        return AppBar();
      case 3:
        return AppBar();
      default:
        return AppBar();
    }
  }

  _body(int index, context) {
    switch (index) {
      case 0:
        return Container();
      case 1:
        return const WatchWidget();
      case 2:
        return Container();
      case 3:
        return Container();
      default:
        return Container();
    }
  }
}
