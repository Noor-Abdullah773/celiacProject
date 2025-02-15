
import 'package:celus_fe/core/views/widgets/cotainerIcon.dart';
import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import 'iconWithValue.dart';
import 'customContainerDialog.dart';

Future<dynamic> dialog(BuildContext context,Widget column) {
    return showDialog(context: context, builder:(con){
        return AlertDialog(
         content:Container(
          width: 300,
          height: 366,
          decoration:BoxDecoration(
            borderRadius: BorderRadius.circular(20)
          ) ,
          child:column
         ) ,
        );
      });
  }