import 'package:flutter/material.dart';
import 'package:tentwenty_test/data/detail_model/detail_model.dart';

abstract class DetailRepo{
  Future<DetailModel> getMovieDetal({required BuildContext context, required String id});
}