
import 'package:flutter/material.dart';
class Box extends StatelessWidget {
  Box({super.key, required this.hintText, required this.hintStyle, required this.suffixIcon, required this.color,this.onChanged});
final String hintText;
final TextStyle hintStyle;
final Widget suffixIcon;
final Color color;
final void Function(String)? onChanged;
final TextEditingController controler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextField(
        //style: AppTextStyle.searchWord,
        controller: controler,
        onSubmitted:(value) {      
        },
        onChanged: onChanged,
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

