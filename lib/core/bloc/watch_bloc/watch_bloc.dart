import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tentwenty_test/core/bloc/watch_bloc/watch_event.dart';
import 'package:tentwenty_test/core/bloc/watch_bloc/watch_state.dart';
import 'package:tentwenty_test/data/model/watch_res_model/watch_res_model.dart';
import 'package:tentwenty_test/data/repositories/watch_repo/watch_repo.dart';

class WatchBloc extends Bloc<WatchEvent, WatchState> {
  WatchRepo repo;
  WatchBloc({required this.repo})
      : super(const GetWatchDataState(isloading: true)) {
    on<GetWatchDataEvent>(
      (event, emit) async{
        emit(WatchStateLoading(isloading: true));
final data = await getWatchData(context: event.context);
emit(GetWatchDataState(isloading: false, model: data));
      },
    );
  }

 Future<WatchResModel> getWatchData({required BuildContext context})async{
return await repo.getWatchData(context: context);
  }
}
