import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tentwenty_test/core/bloc/detail_bloc/detail_event.dart';
import 'package:tentwenty_test/core/bloc/detail_bloc/detail_state.dart';
import 'package:tentwenty_test/data/detail_model/detail_model.dart';
import 'package:tentwenty_test/data/repositories/detail_repo/detail_repo.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailRepo repo;
  DetailBloc({required this.repo})
      : super(const GetDetailDataState(isloading: true)) {
    on<GetDetailDataEvent>(
      (event, emit) async {
        emit(const GetDetailDataState(isloading: true));
        final data =
            await getDetail(context: event.context, id: event.id ?? '');
        emit(GetDetailDataState(isloading: false, model: data));
      },
    );
  }

  Future<DetailModel> getDetail(
      {required BuildContext context, required String id}) async {
    return await repo.getMovieDetal(context: context, id: id);
  }
}
