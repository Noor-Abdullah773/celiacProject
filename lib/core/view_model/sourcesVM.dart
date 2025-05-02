import 'package:celus_fe/core/constants/api_urls.dart';
import 'package:celus_fe/core/models/choise.dart';
import 'package:dio/dio.dart';

import '../../helper/apiException.dart';

class SourceVM{
  final Dio dio;
  SourceVM(this.dio);
    String token='eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJvbWVyIiwiaWF0IjoxNzQ1NTYwNzUzLCJleHAiOjE3NDU1NjIxOTN9.x5fYP6oZ6zLR1hMJ2v1l5yjrGhVV2huzSUBXG6c0E9c';
  final ApiException apiException = ApiException();

  Future <List<ChoiseModel>> get()async{
   Response response = await dio.get(API_URL.sourcesLookup,options: Options(
          headers:{'Authorization': 'Bearer $token'} ,
        ),);
        List<dynamic>data = response.data;
   List<ChoiseModel> choise = data.map((item) => ChoiseModel.fromJson(item)).toList() as List<ChoiseModel>;
   print(choise);
   return choise;
  }
}