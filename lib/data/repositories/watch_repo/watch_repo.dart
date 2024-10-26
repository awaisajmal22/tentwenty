import 'package:flutter/material.dart';
import 'package:tentwenty_test/data/model/watch_res_model/watch_res_model.dart';

abstract class WatchRepo{
    Future<WatchResModel> getWatchData({required BuildContext context});
}