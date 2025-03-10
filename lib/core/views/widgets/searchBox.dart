
import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
class Box extends StatelessWidget {
  const Box({super.key, required this.hintText, required this.hintStyle, required this.suffixIcon, required this.color});
final String hintText;
final TextStyle hintStyle;
final Widget suffixIcon;
final Color color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextFormField(
        //style: AppTextStyle.searchWord,
        decoration:InputDecoration(
          contentPadding:EdgeInsets.symmetric(horizontal: 16,vertical:8) ,
          filled:true,
          fillColor:color,
          hintText: hintText,
         suffixIcon:suffixIcon,
          hintStyle: hintStyle,
          enabledBorder:OutlineInputBorder(
            borderRadius:BorderRadius.circular(16) ,
            borderSide:BorderSide(
              color:color
            )
          ),
          focusedBorder:OutlineInputBorder(
            borderRadius:BorderRadius.circular(16) ,
            borderSide:BorderSide(
              color: color
            )
          )
        ) ,
      ),
    );
    
  }
}

