import 'package:flutter/material.dart';

class CustomButtonWidget extends StatefulWidget {
  const CustomButtonWidget({super.key, required this.height, 
  required this.width, 
  required this.child, 
  this.onTap, 
  this.bgColor, 
  this.border, 
  this.borderRadius});

  final double height;
  final double width;
  final Widget child;
  final Function()? onTap;
 
  final Border? border; 
  final BorderRadius? borderRadius;
   final Color? bgColor;

  @override
  State<CustomButtonWidget> createState() => _CustomButtonWidgetState();
}

class _CustomButtonWidgetState extends State<CustomButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: widget.bgColor,
            borderRadius: widget.borderRadius,
            border: widget.border),
        child: Center(
          child: widget.child
        ),
      ),
    );
  }
}