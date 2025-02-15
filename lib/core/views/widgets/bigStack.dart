import 'package:flutter/material.dart';

import 'navigationBar.dart';

class BigStuck extends StatelessWidget {
   BigStuck({super.key,required this.widget});
Widget widget;
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Container(
        height:MediaQuery.of(context).size.height ,
        width: MediaQuery.of(context).size.width,
        decoration:BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/Home Page.png'), 
              fit: BoxFit.cover, 
            ),
        ) ,
      ) ,
      Positioned(
        top: 55,
        left:20 ,
        right: 20,
        child: Container(
          width: MediaQuery.of(context).size.width -40,
          height: MediaQuery.of(context).size.height,
          decoration:BoxDecoration(
            color:Colors.white ,
            borderRadius: BorderRadius.circular(16)
          ) ,
          child:widget
          ),
      ),
      Positioned(
        bottom:20 ,
        right: 30,
        left:30 ,
        child: CustomNavigationBar()
        )
        ],
      );
  }
}