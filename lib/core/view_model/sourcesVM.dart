import 'package:celus_fe/core/constants/api_urls.dart';
import 'package:celus_fe/core/models/choise.dart';
import 'package:dio/dio.dart';

import '../../helper/apiException.dart';

class SourceVM{
  final Dio dio;
  SourceVM(this.dio);
    String token='eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhYmRhMTFoYSIsImlhdCI6MTczOTM2NDE2MywiZXhwIjoxNzM5OTY4OTYzfQ.MLRRHjoX4nxmu-ADz8uAhlU6z2sixi6f81TTD8XlXcY';
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