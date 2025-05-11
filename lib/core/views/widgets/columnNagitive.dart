import 'package:celus_fe/core/models/choise.dart';
import 'package:celus_fe/core/models/product.dart';
import 'package:celus_fe/core/view_model/reasonsVM.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/text_styles.dart';
import '../../view_model/votingVM.dart';
import 'cotainerIcon.dart';
import 'customContainerDialog.dart';

class ColumnNagitive extends StatefulWidget {
  const ColumnNagitive({super.key,required this.product});
final Product product;

  @override
  State<ColumnNagitive> createState() => _ColumnNagitiveState();
}

class _ColumnNagitiveState extends State<ColumnNagitive> {
   @override
   Map<String,int>data={
     'contributionDecision':0,
      'reasonId':1,
      'sourceId':1
    };
   Map<String,int>deleteVote={
     'contributionDecision':2,
      'reasonId':2,
      'sourceId':2
    };
  var future;
  void initState() {
    super.initState();
    future = ReasonsVM(Dio()).get();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder <List<ChoiseModel>?>(
      future:future ,
      builder:(con,snapshot){
        if (snapshot.hasData){
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            ContainerIcon(imagePath:'assets/images/ok.png', backgroundIcon:AppColors.pinck, containerH:45, containerW:45,
            imageH:16 ,
            imageW:16 ,
            ),
            Text('السبب :',style:AppTextStyle.bold18_black ,),
            GestureDetector(child: CustomContainerDialog(color:AppColors.darkBlue,text:snapshot.data![0].text, height: 49, width:228,textStyle:AppTextStyle.bold14_white),
            onTap: (){
                if (widget.product.voteStatus==null || widget.product.voteStatus=="SAFE") {
                VotingVM(Dio()).postVote(productBarcode:int.parse(widget.product.barcode!), voteData:data);
              }else if(widget.product.voteStatus=="UNSAFE"){
                VotingVM(Dio()).postVote(productBarcode:int.parse(widget.product.barcode!), voteData:deleteVote);
              }
            Navigator.pushNamed(context, "/allProductionScreen" );
            },
            ),
            
             GestureDetector(child: CustomContainerDialog(color:AppColors.darkBlue,text: snapshot.data![1].text ,height: 49, width:228,textStyle:AppTextStyle.bold14_white),
           onTap: (){
                if (widget.product.voteStatus==null|| widget.product.voteStatus=="SAFE") {
                VotingVM(Dio()).postVote(productBarcode:int.parse(widget.product.barcode!), voteData:data);
              }else if(widget.product.voteStatus=="UNSAFE"){
                VotingVM(Dio()).postVote(productBarcode:int.parse(widget.product.barcode!), voteData:deleteVote);
              }
            Navigator.pushNamed(context, "/allProductionScreen" );
            },
             ),
            CustomContainerDialog(color: AppColors.red, text:'إلغاء',height: 49, width:228,textStyle:AppTextStyle.bold14_white)
          ],);
          
        }
         else if(snapshot.hasError)
             return Text('error');
            else 
             return Center(child: CircularProgressIndicator());
      })
   ;
  }
}
 