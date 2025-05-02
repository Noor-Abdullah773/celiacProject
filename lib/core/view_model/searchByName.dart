import 'package:celus_fe/helper/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../helper/apiException.dart';
import '../constants/api_urls.dart';
import '../models/product.dart';

class SearchByNameVM{
  final Dio dio;
  final ApiException apiException = ApiException();
  SearchByNameVM(this.dio);
  String token =
      'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJvbWVyIiwiaWF0IjoxNzQ1NTYwNzUzLCJleHAiOjE3NDU1NjIxOTN9.x5fYP6oZ6zLR1hMJ2v1l5yjrGhVV2huzSUBXG6c0E9c';

  Future<Either<Failure, List<Product>>> get({required name}) async {
    try {
      final response = await dio.get(
        "${API_URL.searchByName}$name",
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      List productsList = response.data;
      List<Product> products =
      productsList.map((item) => Product.fromJson(item)).toList();  
      return Right(products);
    } catch (e) {
      return Left(ServerFailure.handleException(e));
    }
  }
}
