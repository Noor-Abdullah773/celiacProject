import 'package:celus_fe/core/constants/text_styles.dart';
import 'package:celus_fe/core/models/product.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../models/choise.dart';
import '../../view_model/sourcesVM.dart';
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
  var future;
  void initState() {
    super.initState();
    future = SourceVM(Dio()).get();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder <List<ChoiseModel>?>(
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
            Text('مصدر المعلومات:',style:AppTextStyle.bold18_black ,),
             GestureDetector(child: CustomContainerDialog(color:AppColors.darkBlue,text:snapshot.data![0].text ,),
            onTap: (){  Navigator.pushNamed(context, "/infoProduct",arguments:widget.product );},
            ),
            CustomContainerDialog(color:AppColors.darkBlue,text: snapshot.data![1].text,),
            CustomContainerDialog(color: AppColors.red, text:'إلغاء')
          ],);
        }
        else if(snapshot.hasError)
             return Text('error');
            else 
             return Center(child: CircularProgressIndicator());
      })
    /* Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            ContainerIcon(imagePath:'assets/images/ok.png', backgroundIcon:AppColors.lightGreen, containerH:45, containerW:45,
            imageH:32.73 ,
            imageW:32.73 ,
            ),
            Text('مصدر المعلومات:',style:AppTextStyle.bold18_black ,),
             GestureDetector(child: CustomContainerDialog(color:AppColors.darkBlue,text:'تجربة شخصية (عدم ظهور أعراض)' ,),
            onTap: (){  Navigator.pushNamed(context, "/infoProduct",arguments:widget.product );},
            ),
            CustomContainerDialog(color:AppColors.darkBlue,text: 'التواصل مع الشركة',),
            CustomContainerDialog(color: AppColors.red, text:'إلغاء')
          ],)*/ ;
  }
}

