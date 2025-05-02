import 'package:celus_fe/helper/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../helper/apiException.dart';
import '../constants/api_urls.dart';
import '../models/product.dart';

class ProductsVM {
  final Dio dio;
  final ApiException apiException = ApiException();
  ProductsVM(this.dio);
  String token='eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJvbWVyIiwiaWF0IjoxNzQ2MjEyMzM2LCJleHAiOjE3NDYyMTM3NzZ9.beBgYZWRF1C-aW70xxs3CRRNxzP2xxc0OorX94rTz5Q';
  
  // GET request
  Future<Either<Failure,List<Product>>> get({required int pageNumber}) async {
    try {
      final response = await dio.get('http://152.53.32.75:8000/api/product?page=5',options: Options(
          headers:{'Authorization': 'Bearer $token'} ,),);
        print(pageNumber);
      List productLst=response.data;
      print(response.data);
     List<Product> products =productLst.map((item) => Product.fromJson(item)).toList();
      return Right(products);
    } catch(e){
      print('e = $e');
      return Left(ServerFailure.handleException(e));
    }
   
  }
int checkUserProductVote({required Product product})
{
  
   return 0;
  
}
  // POST request
}