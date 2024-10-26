import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:tentwenty_test/data/model/result_model/result_model.dart';
part 'watch_res_model.freezed.dart';
part 'watch_res_model.g.dart';
@Freezed()
class WatchResModel with _$WatchResModel{
   
   factory WatchResModel({
   @Freezed() Map<String,dynamic>? dates,
   @Default(-1) int? page,
   @Default([]) List<Map<String,dynamic>>? results,
   @Default(-1) int? total_pages,
  @Default(-1)  int? total_results,
   }) = _WatchResModel;
    factory WatchResModel.fromJson(Map<String, dynamic> json)=> _$WatchResModelFromJson(json);
}

