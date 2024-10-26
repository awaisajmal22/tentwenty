import 'package:flutter/material.dart';
import 'package:tentwenty_test/core/constant/constant.dart';
import 'package:tentwenty_test/data/model/result_model/result_model.dart';
import 'package:tentwenty_test/data/model/watch_res_model/watch_res_model.dart';
import 'package:tentwenty_test/data/network/api_services.dart';
import 'package:tentwenty_test/data/network/api_url.dart';
import 'package:tentwenty_test/data/repositories/watch_repo/watch_repo.dart';

class DioWatchRepo implements WatchRepo{
  @override
  Future<WatchResModel> getWatchData({required BuildContext context})async {
     WatchResModel model = WatchResModel.fromJson({});
 try{
 
  final response = await API().getRequest(context, "${ApiUrl.upComing}?api_key=${Constant.apiKey}");
  if(response.statusCode == 200){
    print('Data is ${response.data}');
     List<dynamic> results = response.data['results'];
        
      
        List<Results> data = results.map((e) => Results.fromJson(e as Map<String, dynamic>)).toList();
        
      
        List<Map<String, dynamic>> resultsAsMap = data.map((e) => e.toJson()).toList();
        
    model = WatchResModel.fromJson(response.data).copyWith(results: resultsAsMap);
  }
 }catch(e){}
 return model;
  }

}