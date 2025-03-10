import 'package:flutter/material.dart';

import '../../constants/text_styles.dart';

class CustomContainerDialog extends StatelessWidget {
  const CustomContainerDialog({super.key,required this.color,required this.text,required this.height,required this.width,
  required this.textStyle
  });
final Color color;
final String text;
final double width;
final double height;
final TextStyle textStyle;
  @override
  Widget build(BuildContext context) {
    return Container(
                width:width,
                height:height,
                decoration:BoxDecoration(
                  color: color,
                  borderRadius:BorderRadius.circular(12) 
                ) ,
                child: Center(child: Text(text,style:textStyle,)),
              );
  }
}