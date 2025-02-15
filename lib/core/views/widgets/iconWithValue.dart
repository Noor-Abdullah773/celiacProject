import 'package:flutter/material.dart';

class IconWithValue extends StatelessWidget {
   IconWithValue({super.key,required this.imagePath,required this.backgroundIcon,this.value,required this.containerH,
  required this.containerW,required this.imageH,required this.imageW,required this.function
  });
 final String imagePath;
 final Color backgroundIcon;
 final int? value;
 final double containerH;
 final double containerW;
 final double imageW;
 final double imageH;
 final Function(BuildContext context) function;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){function(context);}
        
       ,
      child: Container(
        height:containerH ,
        width:containerW,
        decoration:BoxDecoration(
          borderRadius:BorderRadius.circular(3) ,
          color:backgroundIcon
        ) ,
        child:Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath,height:16 ,width: 16,fit:BoxFit.fill ,),
            value != null? Padding(
              padding: const EdgeInsets.only(right:5 ),
              child: Text(value.toString()!,style:TextStyle(fontSize:8 ) ,),
            ) :SizedBox()
          ],
        ) ,
      ),
    );
  }

  
}