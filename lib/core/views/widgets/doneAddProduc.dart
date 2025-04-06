import 'package:celus_fe/core/views/widgets/bigStack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants/app_colors.dart';
import '../../constants/text_styles.dart';
import 'customContainerDialog.dart';

class DoneAddProduct extends StatelessWidget {
  const DoneAddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(padding: EdgeInsets.only(bottom: 200,left:20,right:20),
          children: [
               Text('إضافة منتج', style:AppTextStyle.mainWord ,),
            SizedBox(height:30),
        Center(
          child: Container(
                 height:100,
                 width: 100,
                child:ClipRRect(
                  child:SvgPicture.asset('assets/images/party-popper.svg',fit:BoxFit.fill ,
                  matchTextDirection:true,alignment:Alignment.centerRight ,
                  ),
                ) ,
               ),
        ),
        SizedBox(height:25 ,),
        Center(child: Text('تم!',style:AppTextStyle.bold14 ,)),
        SizedBox(height:10),
        Center(child:Text('شكراً لك! نشرنا المنتج في قائمة المنتجات التي تحتاج إلى مشاركة معلومات من المستخدمين الآخرين حول احتوائها على الجلوتين.',
        style:AppTextStyle.bold12_mediemGrey ,
            textAlign:TextAlign.center ,
        )),
        SizedBox(height:8),
        Divider(color:AppColors.lightGrey ,thickness:2),
        SizedBox(height:8),
        Center(child: Text('إذا كان لديك معلومات حول احتواء هذا المنتج هذا المنتج على الجلوتين، يمكنك إضافتها الآن:',
        style:AppTextStyle.bold12_mediemGrey ,
        textAlign: TextAlign.center,
        ),),
        SizedBox(height:18),
         Center(child:CustomContainerDialog(
          height:52 ,
          width:139 ,
          text:'أضف معلوماتك حول هذا المنتج',
          color:AppColors.notFoundGrey,
          textStyle:AppTextStyle.bold12_white) ,
          ),
           SizedBox(height:8),
           Divider(color:AppColors.lightGrey ,thickness:2),
           SizedBox(height:8),
            Center(child:CustomContainerDialog(
          height:29 ,
          width:145 ,
          text:'إنهاء',color:AppColors.darkBlue ,textStyle:AppTextStyle.bold14_white
          ) ,
          )
        ],)
       ;
  }
}