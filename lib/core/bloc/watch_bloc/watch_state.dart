import 'package:flutter/material.dart';
import 'package:tentwenty_test/data/model/watch_res_model/watch_res_model.dart';

@immutable
abstract class WatchState{
final bool isloading;
const WatchState({required this.isloading });
}
class WatchStateLoading extends WatchState{
  WatchStateLoading({required super.isloading});
  
}
class GetWatchDataState extends WatchState{
  final WatchResModel? model;
  const GetWatchDataState({required super.isloading, this.model});
  
}