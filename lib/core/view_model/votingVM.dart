import 'package:celus_fe/core/constants/api_urls.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../helper/apiException.dart';
import '../../helper/error/failures.dart';

class VotingVM{
   final Dio dio;
   VotingVM(this.dio);
    String token='eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJvbWVyIiwiaWF0IjoxNzQ1NTYwNzUzLCJleHAiOjE3NDU1NjIxOTN9.x5fYP6oZ6zLR1hMJ2v1l5yjrGhVV2huzSUBXG6c0E9c';
  final ApiException apiException = ApiException();
 Future<Either<Failure,void>> postVote({required int productBarcode,required Map<String,int>voteData})async{
    try {
  final response = await dio.post('${API_URL.allProductsUrl}/$productBarcode/${API_URL.vote}', data:voteData, options: Options(
        headers:{'Authorization': 'Bearer $token'} ,
      ),);
  print('ok');
  return Right(null);
} on Exception catch (e) {
  return Left(ServerFailure.handleException(e));
}

  }
  Map<String,int> voteData({required int contributionDecision,required int reasonId,required int sourceId }){
    Map<String,int> voteInfo={};
    voteInfo['contributionDecision']=contributionDecision;
    voteInfo['reasonId']=reasonId;
    voteInfo['sourceId']=sourceId;
    return voteInfo;
  }
}