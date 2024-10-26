import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tentwenty_test/core/bloc/watch_bloc/watch_bloc.dart';
import 'package:tentwenty_test/core/bloc/watch_bloc/watch_event.dart';
import 'package:tentwenty_test/core/bloc/watch_bloc/watch_state.dart';
import 'package:tentwenty_test/core/colors/color_palette.dart';
import 'package:tentwenty_test/data/model/result_model/result_model.dart';
import 'package:tentwenty_test/screens/watch/component/watch_widget.dart';
import 'package:tentwenty_test/utils/app_text.dart';

class WatchWidget extends HookWidget {
  const WatchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final watchBloc = useMemoized(() => BlocProvider.of<WatchBloc>(context));
    final model = useState<List<Results>>([]);
    return BlocConsumer<WatchBloc, WatchState>(
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
        return ListView.builder(
            padding:const  EdgeInsets.symmetric(horizontal: 20),
            itemCount: model.value.length,
            itemBuilder: (context, index) {
              Results result = model.value[index];
              return watchWidget(
                  movieId: result.id.toString(),
                  context: context,
                  image: result.poster_path!,
                  title: result.title!);
            });
      },
    );
  }
}
