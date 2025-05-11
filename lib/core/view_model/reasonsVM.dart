import 'package:celus_fe/core/constants/api_urls.dart';
import 'package:celus_fe/core/models/choise.dart';
import 'package:dio/dio.dart';

import '../../helper/apiException.dart';

class ReasonsVM{
  final Dio dio;
  ReasonsVM(this.dio);
    String token='eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJvbWVyIiwiaWF0IjoxNzQ2NjQyNTQyLCJleHAiOjE3NDcyNDczNDJ9.0qbUsUxH0Az1LywNIi5VLdOab8l-wkLJMtLEP8faJaY';
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