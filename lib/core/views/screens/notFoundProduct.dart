import 'package:celus_fe/core/constants/app_colors.dart';
import 'package:celus_fe/core/views/widgets/bigStack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/text_styles.dart';
import '../widgets/customContainerDialog.dart';
import '../widgets/searchBox.dart';
import '../widgets/suffixInSearchBox.dart';

class NotFoundProduct extends StatelessWidget {
  const NotFoundProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:BigStuck(widget:Padding(
        padding:EdgeInsets.only(right: 27,left: 27,top: 24) ,
        child: Column(crossAxisAlignment:CrossAxisAlignment.start ,
          children: [
           Text (
              'المنتجات',
              style:AppTextStyle.mainWord
              ),
            SizedBox(height:18 ,),
            Box(hintStyle:AppTextStyle.searchWord, hintText: 'بحث', suffixIcon:SuffixInSearchBox(), color:AppColors.lightGrey,),
            SizedBox(height:36 ,),
            Center(child:  Container(
                   height:45,
                   width: 45,
                  child:ClipRRect(
                    child:Image.asset('assets/images/NothingFound.png',fit:BoxFit.fill ,
                    ),
                  ) ,
                 ),),
                SizedBox(height: 5,),
            Center(child: Text('لم نعثر على هذا المنتج.',style:AppTextStyle.notFoundGrey ,),),
            SizedBox(height:10 ,),
            Center(child: Padding(
              padding:EdgeInsets.symmetric(horizontal:10 ) ,
              child: Text('يمكنك إضافة المنتج إلى قائمة المنتجات التي تحتاج إلى مشاركة معلومات من المستخدمين الآخرين',
              style:AppTextStyle.bold10_grey ,textAlign:TextAlign.center ,
              ),
            ),),
            SizedBox(height:15 ,),
          GestureDetector(child: const Center(
            child:CustomContainerDialog(height:29 ,width:150,text:'اسأل عن هذا المنتج' ,
            color: AppColors.notFoundGrey,textStyle:AppTextStyle.bold12_white) ,),
          onTap:(){Navigator.pushNamed(context, "/addProductScreen", );} ,
            )
        ],),
      )) ,
    );
  }
}