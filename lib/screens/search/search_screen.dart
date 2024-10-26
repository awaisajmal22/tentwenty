import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tentwenty_test/config/extensions/height_width_extension.dart';
import 'package:tentwenty_test/config/extensions/size_extension.dart';
import 'package:tentwenty_test/core/bloc/watch_bloc/watch_bloc.dart';
import 'package:tentwenty_test/core/bloc/watch_bloc/watch_event.dart';
import 'package:tentwenty_test/core/bloc/watch_bloc/watch_state.dart';
import 'package:tentwenty_test/core/colors/color_palette.dart';
import 'package:tentwenty_test/data/model/result_model/result_model.dart';
import 'package:tentwenty_test/data/model/watch_res_model/watch_res_model.dart';
import 'package:tentwenty_test/gen/assets.gen.dart';
import 'package:tentwenty_test/utils/app_text.dart';
import 'package:tentwenty_test/utils/text_field.dart';

class SearchScreen extends HookWidget {
  const SearchScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final watchBloc = useMemoized(() => BlocProvider.of<WatchBloc>(context));
    final model = useState<List<Results>>([]);
    final filteredList = useState<List<Results>>([]);
    final controller = useTextEditingController();
    void onSearchChanged(String query) {
      filteredList.value = [];
      if (query.isEmpty) {
      } else {
        filteredList.value = model.value
            .where((item) =>
                item.title!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    }

    return Scaffold(
      appBar: PreferredSize(
          preferredSize:
              Size(context.getSize.width, context.getSize.height * 0.15),
          child: Container(
            height: context.getSize.height * 0.15,
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            color: Colors.white,
            child: textField(
                prefixIcon: Icon(Icons.search),
                suffixIcon: GestureDetector(
                    onTap: () {
                      controller.clear();
                      filteredList.value = [];
                    },
                    child: Icon(Icons.close)),
                context: context,
                controller: controller,
                hintText: 'TV,shows, movies and more..',
                onChange: (val) {
                  onSearchChanged(val);
                }),
          )),
      body: BlocConsumer<WatchBloc, WatchState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        bloc: watchBloc..add(GetWatchDataEvent(context: context)),
        builder: (context, state) {
          if (state is WatchStateLoading) {
            if (state.isloading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: ColorPalette.darkblue,
                ),
              );
            }
          } else if (state is GetWatchDataState) {
            state.model?.results?.forEach((e) =>
                model.value.add(Results.fromJson(e as Map<String, dynamic>)));
          }
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                context.heightBox(0.02),
                appText(
                  context: context,
                  text: 'Top Results',
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: ColorPalette.darkblue,
                ),
                context.heightBox(0.005),
                Divider(
                  color: Colors.black.withOpacity(0.11),
                ),
                context.heightBox(0.005),
                if (filteredList.value.isNotEmpty)
                  Column(
                    children: List.generate(filteredList.value.length, (index) {
                      Results data = filteredList.value[index];
                      return Padding(
                        padding: const EdgeInsets.only(
                          bottom: 20,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: context.getSize.width * 0.4,
                              height: context.getSize.height * 0.15,
                              decoration: BoxDecoration(
                                  color: ColorPalette.darkblue,
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            context.widthBox(0.01),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: context.getSize.width * 0.4,
                                  child: appText(
                                    maxLines: 2,
                                    context: context,
                                    text: data.title!,
                                    align: TextAlign.left,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: ColorPalette.darkblue,
                                  ),
                                ),
                                SizedBox(
                                  width: context.getSize.width * 0.4,
                                  child: appText(
                                    align: TextAlign.left,
                                    maxLines: 2,
                                    context: context,
                                    text: data.title!,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffDBDBDF),
                                  ),
                                ),
                              ],
                            ),
                            context.widthBox(0.005),
                            Icon(
                              Icons.more_horiz_rounded,
                              color: ColorPalette.blue,
                            )
                          ],
                        ),
                      );
                    }),
                  )
              ],
            ),
          );
        },
      ),
    );
  }
}
