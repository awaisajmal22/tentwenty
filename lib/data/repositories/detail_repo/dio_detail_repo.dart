import 'package:flutter/src/widgets/framework.dart';
import 'package:tentwenty_test/core/constant/constant.dart';
import 'package:tentwenty_test/data/detail_model/detail_model.dart';
import 'package:tentwenty_test/data/network/api_services.dart';
import 'package:tentwenty_test/data/network/api_url.dart';
import 'package:tentwenty_test/data/repositories/detail_repo/detail_repo.dart';

class DioDetailRepo implements DetailRepo{
  @override
  Future<DetailModel> getMovieDetal({required BuildContext context, required String id}) async{
   DetailModel model = DetailModel.fromJson({});
   try{
    final response = await API().getRequest(context, ApiUrl.detail + id + '?api_key=${Constant.apiKey}');
    if(response.statusCode == 200){
      print("Detail Data ${response.data}");
      model = DetailModel.fromJson(response.data);
    }

   }catch(e){

   }
   return model;
  }
  
}