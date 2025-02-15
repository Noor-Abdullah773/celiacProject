import 'package:celus_fe/core/constants/text_styles.dart';
import 'package:celus_fe/core/models/product.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../widgets/bigStack.dart';

class NotSaveVoting extends StatelessWidget {
   NotSaveVoting({super.key,required this.product});
late Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BigStuck(widget:Padding(
        padding:EdgeInsets.only(right:30,left: 30,top:25 ,bottom: 40 ),
        child: Column(children: [
          GestureDetector(
            child: Row(
              children: [
                Text('<  ', style:AppTextStyle.bold12_mediemGrey ,),
                Text('رجوع',
                style:AppTextStyle.bold12_mediemGrey ,
                ),
              ],
            ),
            onTap:(){
              Navigator.of(context).pop();
            } ,
          ),
          SizedBox(height:10 ,),
          Container(
            child:Row(children: [
              Expanded(
                flex: 2,
                child:Text(
                  product.productName,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontFamily: 'Samim',
                  fontWeight: FontWeight.w700,
                  ),),
                ),
              Expanded(child: Container(
               height:102,
              child:ClipRRect(
                 borderRadius: BorderRadius.circular(16),
                child:product.imageURL!=null? Image.network(product.imageURL!,fit:BoxFit.fill):
                 Image.asset('assets/images/image 1.png',fit:BoxFit.fill ,),
                 
              ) ,
             ),),
            ],) , 
          ),
          SizedBox(height: 35,),
          Divider(color:AppColors.lightGrey ,thickness:2),
           SizedBox(height: 39,),
           Container(
            width: MediaQuery.of(context).size.width,
            decoration:BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color:AppColors.pinck 
            ) ,
            child:Padding(
              padding:  EdgeInsets.symmetric(vertical: 14,horizontal:20 ),
              child: Column(
                children: [
                Icon(Icons.error,color:Colors.red ,size:28 ,),
                Text(
                  'هذا المنتج موسوم كغير آمن',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                  color: Color(0xFFF44336),
                  fontSize: 14,
                  fontFamily: 'Samim',
                  fontWeight: FontWeight.w700,
                  ),),
                Text(
'٣ مستخدمين أبلغوا أن هذا المنتج يحتوي على الجلوتين كأحد المكونات.',
textAlign: TextAlign.center,
style: TextStyle(
color: Colors.black,
fontSize: 10,
fontFamily: 'Samim',
fontWeight: FontWeight.w700,
height: 2,
),
)
              ],),
            ) ,
           )
        ]),
        
      ),),
    );
  }
}