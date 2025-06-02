import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../classes/voteData.dart';
import '../../constants/app_colors.dart';
import '../../constants/text_styles.dart';
import '../../view_model/votingVM.dart';
import 'customContainrtWithWidget.dart';

class CustomVoteColumn extends StatefulWidget {
  const CustomVoteColumn({super.key,required this.barcode});
final String barcode;

  @override
  State<CustomVoteColumn> createState() => _CustomVoteColumnState();
}

class _CustomVoteColumnState extends State<CustomVoteColumn> {
  @override
  bool isLoading =false;
  Widget build(BuildContext context) {
    VoteData voteData=VoteData();
    return  ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Column(
                  children: [
                    Text('هل تعرف إذا كان هذا المنتج مناسب لمريض السيلياك؟',
                        style: AppTextStyle.bold12_mediemGrey,
                        textAlign: TextAlign.center),
                    SizedBox(
                      height: 8,
                    ),
                    GestureDetector(
                      child: CustomContainer(
                          colorContainer: AppColors.lightGreen,
                          colorBorder: AppColors.lightGreen,
                          widget: Row(
                            children: [
                              Image.asset(
                                'assets/images/ok.png',
                                fit: BoxFit.fill,
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              Text(
                                'مناسب لمريض السيلياك',
                                style: AppTextStyle.darkGreen10,
                              )
                            ],
                          )),
                          onTap:()async{
                            isLoading= true;
                setState(() {
                  
                });
                            await VotingVM(Dio()).postVote(productBarcode:int.parse(widget.barcode!) , voteData:voteData.positiveVote);
                            isLoading= false;
                setState(() {
                  
                });
                          } ,
                    ),
                    GestureDetector(
                      child: CustomContainer(
                          colorContainer: AppColors.pinck,
                          colorBorder: AppColors.pinck,
                          widget: Row(
                            children: [
                              Image.asset(
                                'assets/images/ok.png',
                                fit: BoxFit.fill,
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              Text(
                                'غير مناسب لمريض السيلياك',
                                style: AppTextStyle.darkPinck10,
                              )
                            ],
                          )),
                          onTap: ()async{
                            isLoading= true;
                setState(() {
                  
                });
                             await VotingVM(Dio()).postVote(productBarcode:int.parse(widget.barcode), voteData:voteData.deleteVote);
                             isLoading= true;
                setState(() {
                  
                });
                          },
                    )
                  ],
                ),
    );
  }
}