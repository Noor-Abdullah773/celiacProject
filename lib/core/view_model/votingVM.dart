import 'package:celus_fe/core/constants/api_urls.dart';
import 'package:dio/dio.dart';
import '../../helper/apiException.dart';

class VotingVM{
   final Dio dio;
   VotingVM(this.dio);
    String token='eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJvbWVyIiwiaWF0IjoxNzQzNTA0MjEyLCJleHAiOjE3NDQxMDkwMTJ9.I-2hnR9HW-nep-mklSgcFFMWu0ITCq7h7pXc890-Rs0';
  final ApiException apiException = ApiException();
  postVote({required int productId,required Map<String,int>voteData})async{
    final response = await dio.post('${API_URL.allProductsUrl}/$productId/${API_URL.vote}', data:voteData, options: Options(
          headers:{'Authorization': 'Bearer $token'} ,
        ),);
    print(response);
    print('ok');

  }
  Map<String,int> voteData({required int contributionDecision,required int reasonId,required int sourceId }){
    Map<String,int> voteInfo={};
    voteInfo['contributionDecision']=contributionDecision;
    voteInfo['reasonId']=reasonId;
    voteInfo['sourceId']=sourceId;
    return voteInfo;
  }
}