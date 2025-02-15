import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class VerticalLine extends StatelessWidget {
  const VerticalLine({super.key,required this.height});
final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width:1 ,
      height: height,
      color:AppColors.black
    );
  }
}