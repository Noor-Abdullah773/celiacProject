import 'package:dio/dio.dart';

import '../../helper/apiException.dart';
import '../constants/api_urls.dart';
import '../models/product.dart';

class SearchByNameVM{
  final Dio dio;
  final ApiException apiException = ApiException();
  SearchByNameVM(this.dio);
  String token='eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJBbWFyIiwiaWF0IjoxNzQxNDI3Njc3LCJleHAiOjE3NDIwMzI0Nzd9.0VxFmLKzNWrnYQ5_q3woDgDqyyQLNwuk_fElZEhcb5Q';

  Future<List<dynamic>?> get({required name})async{
    try {
  final response =await dio.get("${API_URL.searchByName}$name",options: Options(
        headers:{'Authorization': 'Bearer $token'} ,
      ),);
       List<dynamic> products =response.data.map((item) => Product.fromJson(item)).toList() as List<dynamic>;
      print(products);
      return products;
 
} on DioException catch(e){
      apiException.handleError(e);
    print( apiException.handleError(e));
    } on
    Exception catch (e){
      print(e);
     // return [];
  
    }
  }
}