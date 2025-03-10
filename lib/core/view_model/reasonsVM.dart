import 'package:celus_fe/core/constants/api_urls.dart';
import 'package:celus_fe/core/models/choise.dart';
import 'package:dio/dio.dart';

import '../../helper/apiException.dart';

class ReasonsVM{
  final Dio dio;
  ReasonsVM(this.dio);
    String token='eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJBbWFyIiwiaWF0IjoxNzQxNDI3Njc3LCJleHAiOjE3NDIwMzI0Nzd9.0VxFmLKzNWrnYQ5_q3woDgDqyyQLNwuk_fElZEhcb5Q';
  final ApiException apiException = ApiException();

  Future <List<ChoiseModel>> get()async{
   Response response = await dio.get(API_URL.reasonsLookup,options: Options(
          headers:{'Authorization': 'Bearer $token'} ,
        ),);
       
        List<dynamic>data = response.data;
   List<ChoiseModel> choise = data.map((item) => ChoiseModel.fromJson(item)).toList() as List<ChoiseModel>;
  
   return choise;
  }
}