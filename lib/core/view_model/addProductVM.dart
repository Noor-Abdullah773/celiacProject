import 'package:celus_fe/core/constants/api_urls.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../helper/apiException.dart';
import '../../helper/error/failures.dart';

class AddProductVM{
   final Dio dio;
   AddProductVM(this.dio);
    String token='eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJvbWVyIiwiaWF0IjoxNzQ0NzA1MTkyLCJleHAiOjE3NDUzMDk5OTJ9.LA4OKzJ7h8Zd0phvRLYus8i_kMT4MRzXB1SNtJZ6EYI';
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