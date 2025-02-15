import 'package:flutter/material.dart';

class CircularIndicator extends StatelessWidget {
  const CircularIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          color: Colors.transparent,  // اجعل اللون شفافًا
          border: Border.all(
            color: Color(0xFFF3B134),  // اللون البني للإطار
            width: 3,                  // سمك الإطار
          ),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Center(
                child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: Color(0xFFF3B134), 
                  borderRadius: BorderRadius.circular(30),
                ),
                ),
              )
    );

    
  }
}