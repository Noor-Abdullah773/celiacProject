// import 'package:flutter/material.dart';
// import '../../constants/text_styles.dart';
// import 'bigStack.dart';

// class MyWidget extends StatelessWidget {
//   const MyWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BigStuck(widget:Padding(
//       padding:EdgeInsets.only(right:30,left: 30,top:25 ,bottom: 40 ),
//       child: Column(children: [
//         GestureDetector(
//           child: Row(
//             children: [
//               Text('<  ', style:AppTextStyle.bold12_mediemGrey ,),
//               Text('رجوع',
//               style:AppTextStyle.bold12_mediemGrey ,
//               ),
//             ],
//           ),
//           onTap:(){
//             Navigator.of(context).pop();
//           } ,
//         ),
//         SizedBox(height:10 ,),
//         Container(
//           child:Row(children: [
//             Expanded(
//               flex: 2,
//               child:Text(
//                 widget.product.productName,
//                 style:AppTextStyle.bold25_black
//               ),
//               ),
//             Expanded(child: Container(
//              height:102,
//             child:ClipRRect(
//                borderRadius: BorderRadius.circular(16),
//               child:widget.product.imageURL!=null? Image.network(widget.product.imageURL!.path,fit:BoxFit.fill):
//                Image.asset('assets/images/image 1.png',fit:BoxFit.fill ,),
//             ) ,
//            ),),
//           ],) , 
//         ),
//         SizedBox(height: 35,),
//         Divider(color:AppColors.lightGrey ,thickness:2),
//          SizedBox(height: 39,),
//         FutureBuilder <ProductState?>(
//           future:future ,
//           builder:(con,snapshot) {
//            if(snapshot.hasData)
//            {  Map<String,dynamic> mapInfo= ProductByBarcodeVM(Dio()).checkState(productSafetyStatus:snapshot.data!.productSafetyStatus,);
//              return Container(
//           width: MediaQuery.of(context).size.width,
//           decoration:BoxDecoration(
//             borderRadius: BorderRadius.circular(16),
//             color:mapInfo['colorContainer']
//           ) ,
//           child:Padding(
//             padding:  EdgeInsets.symmetric(vertical: 14,horizontal:20 ),
//             child: Column(
//               children: [
//               Icon(mapInfo['icon'],color:mapInfo['colorIcon'],size:28 ,textDirection:TextDirection.ltr),
//               Text(mapInfo['state'],
//              style:mapInfo['textStyle'], textAlign:TextAlign.center,),
//            Text(ProductByBarcodeVM(Dio()).checkType(type:mapInfo['type'], positiveVotes:widget.product.positiveVotes, negativeVotes:widget.product.negativeVotes),
//             textAlign: TextAlign.center,
//             style:AppTextStyle.bold10_black 
//             ),
//              mapInfo['type']==4? CustomContainerDialog(height:29 ,width:139,color:AppColors.darkBlue ,
//              text:'ابدأ المسح' ,textStyle:AppTextStyle.bold12_white ,
//              )
//              :Container()
//             ],),
//           ) ,
//          );
//            }
//       else if(snapshot.hasError){
//         return const Text('error');
//       }
//       else {
//         return const Center(child: CircularProgressIndicator());
//       }
    
//           }
//           )
//       ]),
      
//     ),);
//   }
// }
//   }
// }