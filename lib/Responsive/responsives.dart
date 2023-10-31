import 'package:flutter/material.dart';

class Responsiveness extends StatelessWidget {
 
  const Responsiveness({super.key, required this.isMobileScreen, required this.isDesktopScreen});

 final Widget isMobileScreen; 
  final Widget isDesktopScreen; 

static bool isMobilescreen(BuildContext context){
  return MediaQuery.sizeOf(context).width < 700 && MediaQuery.sizeOf(context).height < 700;
}

static bool isDesktop(BuildContext context){
  return MediaQuery.sizeOf(context).width > 700 && MediaQuery.sizeOf(context).height > 700;
}


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, boxconstraints){
      if(boxconstraints.maxWidth > 700){
        return isMobileScreen;
      }
      return isDesktopScreen;
    });
  }
}