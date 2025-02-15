import 'package:celus_fe/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 298,
      height: 61,
      decoration:BoxDecoration(
        borderRadius: BorderRadius.circular(30.50),
        color: AppColors.lightBlak
      ) ,
    );
  }
}