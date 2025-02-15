
import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppTextStyle {

  static const TextStyle mainWord = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 30,
    fontFamily:'Samim',
    color:AppColors.black,
  );

  static TextStyle searchWord = TextStyle(
    fontSize: 18,
    fontFamily: 'Samim',
    fontWeight: FontWeight.w700,
    color:AppColors.darkGrey,
  );

  static const TextStyle bold8 = TextStyle(
   color: AppColors.black,
       fontSize: 8,
       fontFamily: 'Samim',
       fontWeight: FontWeight.w700,
  );
   static const TextStyle greyBold8 = TextStyle(
   color: AppColors.meduimGrey,
       fontSize: 8,
       fontFamily: 'Samim',
       fontWeight: FontWeight.w700,
  );
  static const TextStyle bold14 = TextStyle(
              color: AppColors.black,
              fontSize: 14,
              fontFamily: 'Samim',
              fontWeight: FontWeight.w700,
              );
  static const TextStyle bold14_white = TextStyle(
              color:Colors.white,
              fontSize: 14,
              fontFamily: 'Samim',
              fontWeight: FontWeight.w700,
              );
  static const TextStyle bold18_black = TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontFamily: 'Samim',
              fontWeight: FontWeight.w700,
              );
 static const TextStyle bold12_mediemGrey = TextStyle(
              color: AppColors.meduimGrey,
              fontSize: 12,
              fontFamily: 'Samim',
              fontWeight: FontWeight.w700,
              );

}