import 'package:celus_fe/core/constants/api_urls.dart';
import 'package:celus_fe/core/models/choise.dart';
import 'package:dio/dio.dart';

import '../../helper/apiException.dart';

class SourceVM{
  final Dio dio;
  SourceVM(this.dio);
    String token='eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJvbWVyIiwiaWF0IjoxNzQ0MTgxNTc3LCJleHAiOjE3NDQ3ODYzNzd9.EBHpLly23qKLWVLzuRbCxd21lh2MuqrAzhhkCmLmExE';
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