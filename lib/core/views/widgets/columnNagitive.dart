import 'package:celus_fe/core/models/choise.dart';
import 'package:celus_fe/core/models/product.dart';
import 'package:celus_fe/core/view_model/reasonsVM.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/text_styles.dart';
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
            GestureDetector(child: CustomContainerDialog(color:AppColors.darkBlue,text:snapshot.data![0].text ,),
            onTap: (){  Navigator.pushNamed(context, "/infoProduct",arguments:widget.product );},
            ),
            
             CustomContainerDialog(color:AppColors.darkBlue,text: snapshot.data![1].text ,),
            CustomContainerDialog(color: AppColors.red, text:'إلغاء')
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
 