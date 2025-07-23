import 'package:celus_fe/core/constants/api_urls.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../helper/apiException.dart';
import '../../helper/error/failures.dart';
class AddProductVM{
  
   final Dio dio;
   AddProductVM(this.dio);
    String token='eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJvbWVyIiwiaWF0IjoxNzUyNzMyMDIyLCJleHAiOjE3NTMzMzY4MjJ9.Pe-acEChcPybygu3EyUe9Q5zN_4aoAm6Mo2Qyx1l4WA';
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
 return Right(productUploaderData['barcode']);
}  catch (e) {
  print(ServerFailure.handleException(e).errorMessage);
  return Left(ServerFailure.handleException(e));
}

  }
 
}