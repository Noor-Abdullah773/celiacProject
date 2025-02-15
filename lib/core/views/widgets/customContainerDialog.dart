import 'package:flutter/material.dart';

import '../../constants/text_styles.dart';

class CustomContainerDialog extends StatelessWidget {
  const CustomContainerDialog({super.key,required this.color,required this.text});
final Color color;
final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
                width: 228,
                height: 49,
                decoration:BoxDecoration(
                  color: color,
                  borderRadius:BorderRadius.circular(12) 
                ) ,
                child: Center(child: Text(text,style:AppTextStyle.bold14_white ,)),
              );
  }
}