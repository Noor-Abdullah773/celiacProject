import 'package:celus_fe/core/constants/api_urls.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../helper/apiException.dart';
import '../../helper/error/failures.dart';
class AddProductVM{
   final Dio dio;
   AddProductVM(this.dio);
    String token='eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJvbWVyIiwiaWF0IjoxNzQ1NTYwNzUzLCJleHAiOjE3NDU1NjIxOTN9.x5fYP6oZ6zLR1hMJ2v1l5yjrGhVV2huzSUBXG6c0E9c';
  final ApiException apiException = ApiException();

  Future<Either<Failure, String>> postProduct({required Map<String,dynamic>productUploaderData})async{
    print(productUploaderData);
    try {
       FormData formData = await  FormData.fromMap(productUploaderData);
  final response = await dio.post(API_URL.allProductsUrl, 
  data:formData, options: Options(
        headers:{'Authorization': 'Bearer $token','Content-Type': 'multipart/form-data'}, 
      ),);
   print("ok");
 return Right(productUploaderData['productName']);
}  catch (e) {
  print(ServerFailure.handleException(e).errorMessage);
  return Left(ServerFailure.handleException(e));
}

  }
 
}