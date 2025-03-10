import 'package:celus_fe/core/constants/app_colors.dart';
import 'package:celus_fe/core/views/widgets/bigStack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants/text_styles.dart';
import '../widgets/searchBox.dart';
class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:BigStuck(widget:Padding
      (padding:EdgeInsets.only(right:30,left: 30,top:25 ,),
       child:Column( crossAxisAlignment:CrossAxisAlignment.start  ,
        children: [
           Text('إضافة منتج', style:AppTextStyle.mainWord ,),
            SizedBox(height:30),
        Center(
          child: Container(
                 height:120,
                 width: 100,
                child:ClipRRect(
                  child:SvgPicture.asset('assets/images/noun-tag-5413005.svg',fit:BoxFit.fill ,
                  color:Colors.red ,matchTextDirection:true,alignment:Alignment.centerRight ,
                  ),
                ) ,
               ),
        ),
        Center(child:Text('الخطوة ٢: اسم المنتج',style:AppTextStyle.bold14 ,)),
        SizedBox(height:15 ,),
        Center(child:Text('ما اسم هذا المنتج؟',style:AppTextStyle.bold12_mediemGrey ,)),
         SizedBox(height:15 ,),
        Box(color:AppColors.greyBox, hintStyle:AppTextStyle.bold10_black, hintText: 'مثال: خبز توست', suffixIcon:Container(),)
       ],)
      ),
     
       ) ,
    );
  }
}