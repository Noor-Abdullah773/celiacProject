import 'package:celus_fe/helper/error/exceptions.dart';
import 'package:celus_fe/helper/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../helper/apiException.dart';
import '../models/product.dart';

class ProductsVM {
  final Dio dio;
  final ApiException apiException = ApiException();
  ProductsVM(this.dio);
  String token='eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJvbWVyIiwiaWF0IjoxNzUyNzMyMDIyLCJleHAiOjE3NTMzMzY4MjJ9.Pe-acEChcPybygu3EyUe9Q5zN_4aoAm6Mo2Qyx1l4WA';
  
  // GET request
  Future<Either<Failure,List<Product>>> get({required int pageNumber}) async {
    try {
      final response = await dio.get('http://152.53.32.75:8000/api/product?page=$pageNumber',options: Options(
          headers:{'Authorization': 'Bearer $token'} ,),);
       print(pageNumber);
      List productLst =response.data;
      if(productLst.isEmpty){
        throw ServerException('No More Data');
      }
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