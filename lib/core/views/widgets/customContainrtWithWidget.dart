import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key,required this.colorContainer,required this.colorBorder,required this.widget

  });
final Color colorContainer ;
final Color colorBorder;
final Widget widget;


  @override
  Widget build(BuildContext context) {
    return Container(
                decoration:BoxDecoration(
                  color:colorContainer,
                  borderRadius:BorderRadius.circular(8) ,
                  border:Border.all(color:colorBorder)
                ) ,
                child: Padding(
                  padding:  const EdgeInsets.only(right:15 ,left:15),
                  child: Center(child:widget ),
                ),
              );
  }
}