import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../classes/upload_image.dart';
import '../../constants/app_colors.dart';
import '../../constants/text_styles.dart';
import 'customContainerDialog.dart';
import 'dart:io';
Future<XFile?> dialogImage(BuildContext context) {
  return showDialog<XFile?>(
    context: context,
    builder: (con) {
      return AlertDialog(
        content: Container(
          width: 200,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              GestureDetector(
                child: CustomContainerDialog(
                  height: 29,
                  width: 120,
                  text: 'الكاميرا',
                  color: AppColors.darkBlue,
                  textStyle: AppTextStyle.bold12_white,
                ),
                onTap: () async {
                  UploadImage uploadImage = UploadImage();
                  XFile? image = await uploadImage.pickImageCamira();
                  Navigator.of(con).pop(image); // إرجاع الصورة
                },
              ),
              SizedBox(height: 10),
              GestureDetector(
                child: CustomContainerDialog(
                  height: 29,
                  width: 120,
                  text: 'المعرض',
                  color: AppColors.darkBlue,
                  textStyle: AppTextStyle.bold12_white,
                ),
                onTap: () async {
                  UploadImage uploadImage = UploadImage();
                  XFile? image = await uploadImage.pickImageGallery();
                  Navigator.of(con).pop(image); // إرجاع الصورة
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}
// Future<dynamic> dialogImage(BuildContext context) {
//     return showDialog(context: context, builder:(con){
//         return AlertDialog(
//          content:Container(
//           width: 200,
//           height: 80,
//           decoration:BoxDecoration(
//             borderRadius: BorderRadius.circular(20)
//           ) ,
//           child:Column(children: [
//             GestureDetector(
//               child: CustomContainerDialog(
//               height:29 ,
//               width:120,
//               text:'الكاميرا',color:AppColors.darkBlue ,textStyle:AppTextStyle.bold12_white),
//               onTap: ()async{
//                UploadImage uploadImage =UploadImage();
//                XFile? image =await uploadImage.pickImageCamira();
//                if(image != null){
//                  File fileimage = File(image.path);
//                   print(fileimage);
//                }
               
               
//               },
//             ),
//             SizedBox(height:10 ,),
//              GestureDetector(
//                child: CustomContainerDialog(
//                          height:29 ,
//                          width:120,
//                          text:'المعرض',color:AppColors.darkBlue ,textStyle:AppTextStyle.bold12_white),
//                          onTap: ()async{
//                            UploadImage uploadImage =UploadImage();
//                             XFile? image =await uploadImage.pickImageGallery();
//                           if(image != null){
//                             File fileimage = File(image.path);
//                               print(fileimage);
//                           }
//                                     },
//              ),
//           ],)
//          ) ,
//         );
//       });
//   }