import 'package:celus_fe/core/constants/api_urls.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../helper/apiException.dart';
import '../../helper/error/failures.dart';

class AddProductVM{
   final Dio dio;
   AddProductVM(this.dio);
    String token='eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJvbWVyIiwiaWF0IjoxNzQzNTA0MjEyLCJleHAiOjE3NDQxMDkwMTJ9.I-2hnR9HW-nep-mklSgcFFMWu0ITCq7h7pXc890-Rs0';
  final ApiException apiException = ApiException();

  Future<Either<Failure, void>> postProduct({required Map<String,dynamic>productUploaderData})async{
    print(productUploaderData);
    FormData formData = await FormData.fromMap(productUploaderData);
    try {
  final response = await dio.post(API_URL.allProductsUrl, 
  data:formData, options: Options(
        headers:{'Authorization': 'Bearer $token','Content-Type': 'multipart/form-data'}, 
      ),);
  print(response);
   print("ok");
 return Right(null);
}  catch (e) {
  print(e);
  return Left(ServerFailure.handleException(e));
}

  }
 
}