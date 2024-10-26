
import 'package:flutter/material.dart';
import 'package:tentwenty_test/data/detail_model/detail_model.dart';

@immutable 
abstract class DetailState{
final bool isloading;
const DetailState({required this.isloading });
}
class DetailStateLoading extends DetailState{
  DetailStateLoading({required super.isloading});
  
}
class GetDetailDataState extends DetailState{
  final DetailModel? model;
  const GetDetailDataState({required super.isloading, this.model});
  
}