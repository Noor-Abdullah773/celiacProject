import 'package:celus_fe/core/views/widgets/verticalLine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants/app_colors.dart';
import '../../constants/text_styles.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextFormField(
        style: AppTextStyle.searchWord,
        decoration:InputDecoration(
         
          contentPadding:EdgeInsets.symmetric(horizontal: 16,vertical:8) ,
          filled:true,
          fillColor:AppColors.lightGrey,
          hintText: 'بحث',
         suffixIcon:SizedBox(
          width: 50,
           child: Row(children: [
            Icon(Icons.search,color:AppColors.meduimGrey),
             VerticalLine(height: 16,),
             SizedBox(width: 25,
            height: 24,
            child:SvgPicture.asset('assets/images/like-svgrepo-com.svg' ,height: 20,width: 20,)
            ),
         
           ],),
         ),
          hintStyle: AppTextStyle.searchWord,
          enabledBorder:OutlineInputBorder(
            borderRadius:BorderRadius.circular(16) ,
            borderSide:BorderSide(
              color: AppColors.lightGrey
            )
          ),
          focusedBorder:OutlineInputBorder(
            borderRadius:BorderRadius.circular(16) ,
            borderSide:BorderSide(
              color: AppColors.lightGrey
            )
          )
        ) ,
      ),
    );
    /*Stack(
      children: [
        SizedBox(
         // height:38 ,
          child: TextFormField(
              decoration:InputDecoration(
               // contentPadding:EdgeInsets.symmetric(horizontal: 16,vertical: 32) ,
          filled:true,
          fillColor:AppColors.lightGrey,
          hintText: 'بحث',
          hintStyle: AppTextStyle.searchWord,
          enabledBorder:OutlineInputBorder(
            borderRadius:BorderRadius.circular(16) ,
            borderSide:BorderSide(
              color: AppColors.lightGrey
            )
          ),
          focusedBorder:OutlineInputBorder(
            borderRadius:BorderRadius.circular(16) ,
            borderSide:BorderSide(
              color: AppColors.lightGrey
            )
          )
              ) ,
            ),
        ),
    Positioned(
      left:10 ,
      top: 20,
      child:SizedBox(
        width: 50,
         child: Row(children: [
          Icon(Icons.search,color:AppColors.meduimGrey),
          VerticalLine(height: 16,),
           SizedBox(width: 25,
          height: 24,
          child:SvgPicture.asset('assets/images/like-svgrepo-com.svg' ,height: 20,width: 20,),
          ),
         ],),
       ), 

    )

      ],
    );*/
  }
}

