
import 'package:flutter/material.dart';
import 'package:tonomo/main.dart';

class SSSpacerWidget extends StatelessWidget {
  final double? height; 
  final double? width;
  const SSSpacerWidget({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.sizeOf(context).height;
    screenWidth = MediaQuery.sizeOf(context).width;
   double spacer = 1; 
   double heightspacer = 1;
  if(screenWidth < 400){
    spacer = 0.8;
  }
  if(screenHeight < 600){
    heightspacer = 0.7;
  }
    return   SizedBox(
      height: height ?? 0 * heightspacer , 
      width: width?? 0 * spacer,

    );
  }
}