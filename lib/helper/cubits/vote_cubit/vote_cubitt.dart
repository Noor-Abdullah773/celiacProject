import 'package:bloc/bloc.dart';
import 'package:celus_fe/helper/cubits/vote_cubit/vote_states.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/view_model/votingVM.dart';

class VoteCubit extends Cubit<VoteStates>{
  VoteCubit():super(NoVoteState());
  addVote({required int productBarcode,required Map<String,int>voteData})async{
    emit(LoadingState());
    final result = await VotingVM(Dio()).postVote(productBarcode: productBarcode, voteData: voteData);
    result.fold((left){
     emit(ErrorState(errorMessage:left.errorMessage));
    },(r){
     
    });
  }

}