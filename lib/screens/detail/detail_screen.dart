import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:tentwenty_test/config/extensions/height_width_extension.dart';
import 'package:tentwenty_test/config/extensions/size_extension.dart';
import 'package:tentwenty_test/config/router/routes.dart';
import 'package:tentwenty_test/core/bloc/detail_bloc/detail_bloc.dart';
import 'package:tentwenty_test/core/bloc/detail_bloc/detail_event.dart';
import 'package:tentwenty_test/core/bloc/detail_bloc/detail_state.dart';
import 'package:tentwenty_test/core/colors/color_palette.dart';
import 'package:tentwenty_test/core/constant/constant.dart';
import 'package:tentwenty_test/data/detail_model/detail_model.dart';
import 'package:tentwenty_test/gen/assets.gen.dart';
import 'package:tentwenty_test/utils/app_text.dart';
import 'package:tentwenty_test/utils/loader/loading.dart';
import 'package:tentwenty_test/utils/text_button.dart';

class DetailScreen extends HookWidget {
  final String id;
  DetailScreen({super.key, required this.id});
  final random = Random();
  @override
  Widget build(BuildContext context) {
    final detailBloc = useMemoized(() => BlocProvider.of<DetailBloc>(context));
    final model = useState<DetailModel>(DetailModel.fromJson({}));

    useEffect(() {
      detailBloc.add(GetDetailDataEvent(context: context, id: id));
      return null;
    }, []);
    return Scaffold(
      body: BlocConsumer<DetailBloc, DetailState>(
          bloc: detailBloc,
          builder: (context, state) {
            return Column(
              children: [
                Container(
                  height: context.getSize.height * 0.5,
                  width: context.getSize.width,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(Constant.networkImage),
                          fit: BoxFit.fill)),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 20,
                            top: context.getSize.height * 0.04,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: SvgPicture.asset(
                                  Assets.icons.back,
                                  width: 30,
                                  height: 30,
                                  color: ColorPalette.white,
                                ),
                              ),
                              context.widthBox(0.01),
                              appText(
                                context: context,
                                text: 'Watch',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: ColorPalette.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 20,
                          left: 50,
                          right: 50,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              if (model.value.releaseDate != null)
                                appText(
                                    context: context,
                                    text:
                                        'In Theaters ${DateFormat('MMMM dd, yyyy').format(DateTime.parse(model.value.releaseDate.toString()))}'),
                              context.heightBox(0.01),
                              textButton(
                                  context: context,
                                  onTap: () {
                                    Navigator.pushNamed(context, Routes.ticket,
                                        arguments: model.value);
                                  },
                                  title: 'Get Tickets'),
                              context.heightBox(0.01),
                              iconButton(
                                  bgColor: Colors.transparent,
                                  context: context,
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, Routes.videoPlayer,
                                        arguments:
                                            'https://youtu.be/5wbHn3R2KG4');
                                  },
                                  title: 'Watch Trailer')
                            ],
                          ))
                    ],
                  ),
                ),
                Expanded(
                    child: SingleChildScrollView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  physics: const BouncingScrollPhysics(),
                  child: SizedBox(
                    width: context.getSize.width,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        appText(
                            context: context,
                            text: 'Genres',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: ColorPalette.darkblue),
                        context.heightBox(0.01),
                        Wrap(
                          spacing: 7,
                          runSpacing: 7,
                          children: List.generate(model.value.genres!.length,
                              (index) {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Color.fromRGBO(
                                  random.nextInt(256),
                                  random.nextInt(256),
                                  random.nextInt(256),
                                  1.0,
                                ),
                              ),
                              child: appText(
                                context: context,
                                text: model.value.genres![index].name!,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: ColorPalette.white,
                              ),
                            );
                          }),
                        ),
                        context.heightBox(0.05),
                        appText(
                          context: context,
                          text: 'Overview',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: ColorPalette.darkblue,
                        ),
                        context.heightBox(0.01),
                        appText(
                            context: context,
                            align: TextAlign.left,
                            text: model.value.overview ?? '',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: ColorPalette.darkgrey)
                      ],
                    ),
                  ),
                ))
              ],
            );
          },
          listener: (context, state) {
            if (state is GetDetailDataState) {
              if (state.isloading) {
                return LoadingScreen.inatance()
                    .show(context: context, text: 'Loading....');
              } else {
                LoadingScreen.inatance().hide();
                model.value = state.model ?? DetailModel.fromJson({});
              }
            }
          }),
    );
  }
}
