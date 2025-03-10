import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/app_colors.dart';
import '../../constants/text_styles.dart';
import '../widgets/bigStack.dart';
import '../widgets/customContainerDialog.dart';

class ScanBarcodeOne extends StatelessWidget {
  const ScanBarcodeOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BigStuck(widget:Padding(
      padding:EdgeInsets.only(right:30,left: 30,top:25 ,),
      child: Column(crossAxisAlignment:CrossAxisAlignment.start  ,
        children: [
        Text('إضافة منتج', style:AppTextStyle.mainWord ,),
        SizedBox(height:50),
        Center(
          child: Container(
                 height:120,
                 width: 80,
                child:ClipRRect(
                  child:SvgPicture.asset('assets/images/noun-barcode-scanner-74445.svg',fit:BoxFit.fill ,
                  color:Colors.black ,
                  ),
                ) ,
               ),
        ),
     Center(child:Text('الخطوة ١: المسح الضوئي للباركود',style:AppTextStyle.bold14 ,) ,),
    SizedBox(height: 10,),
     Center(child: Padding(
       padding: const EdgeInsets.symmetric(horizontal:20),
       child: Text('قم بالضغط على زر “ابدأ المسح” في الأسفل ثم قم بتوجيه الكاميرا نحو الباركود على غلاف المنتج.',
       style:AppTextStyle.bold12_mediemGrey ,
       textAlign:TextAlign.center ,
       ),
     )),
     SizedBox(height:24 ,),
     Center(child:CustomContainerDialog(height:29 ,width:139 ,text: 'ابدأ المسح',color:AppColors.darkBlue ,textStyle:AppTextStyle.bold12_white) ,)

      ],),
      ),
        
      ),
    );
  }
}