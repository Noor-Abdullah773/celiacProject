import 'package:celus_fe/core/constants/text_styles.dart';
import 'package:celus_fe/core/models/product.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../models/choise.dart';
import '../../view_model/sourcesVM.dart';
import '../../view_model/votingVM.dart';
import 'cotainerIcon.dart';
import 'customContainerDialog.dart';

class ColumnPosative extends StatefulWidget {
  const ColumnPosative({super.key,required this.product});
final Product product;

  @override
  State<ColumnPosative> createState() => _ColumnPosativeState();
}

class _ColumnPosativeState extends State<ColumnPosative> {
   @override
    Map<String,int>data={
     'contributionDecision':1,
      'reasonId':1,
      'sourceId':1
    };
  late Future<List<ChoiseModel>> future;
  void initState() {
    super.initState();
    future = SourceVM(Dio()).get();
  }
  @override
  
  Widget build(BuildContext context) {
    return FutureBuilder<List<ChoiseModel>?>(
      future: future,
      builder:(con,snapshot){
        if(snapshot.hasData)
        {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            ContainerIcon(imagePath:'assets/images/ok.png', backgroundIcon:AppColors.lightGreen, containerH:45, containerW:45,
            imageH:32.73 ,
            imageW:32.73 ,
            ),
            const Text('مصدر المعلومات:',style:AppTextStyle.bold18_black ,),
             GestureDetector(child: CustomContainerDialog(color:AppColors.darkBlue,text:snapshot.data![0].text ,height: 49, width:228, textStyle:AppTextStyle.bold14_white ,),
            onTap: (){  VotingVM(Dio()).postVote(productId:widget.product.id, voteData:data);
            Navigator.pushNamed(context, "/allProductionScreen" );
            },
            ),
            GestureDetector(child: CustomContainerDialog(color:AppColors.darkBlue,text: snapshot.data![1].text,height: 49, width:228,textStyle:AppTextStyle.bold14_white),
             onTap: (){  VotingVM(Dio()).postVote(productId:widget.product.id, voteData:data);
             Navigator.pushNamed(context, "/allProductionScreen" );
             }
            ),
            const CustomContainerDialog(color: AppColors.red, text:'إلغاء',height: 49, width:228,textStyle:AppTextStyle.bold14_white)
          ],);
        }
        else if(snapshot.hasError){
          return const Text('error');
        }
        else {
          return const Center(child: CircularProgressIndicator());
        }
      
        
      }, );
  }
}