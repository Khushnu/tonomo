import 'package:flutter/material.dart';

class CalendarPageButtonWidget extends StatefulWidget {
  const CalendarPageButtonWidget(
      {super.key,
      required this.height,
      required this.width,
      required this.child,
      this.onTap, required this.borderSide, required this.borderRadius});
      
  final double height;
  final double width;
 
  final Widget child;
  final Border borderSide;
  final BorderRadius borderRadius;
  final Function()? onTap;

  @override
  State<CalendarPageButtonWidget> createState() =>
      _CalendarPageButtonWidgetState();
}

class _CalendarPageButtonWidgetState extends State<CalendarPageButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
            borderRadius: widget.borderRadius,
            boxShadow: const [
            
            ],
            border: widget.borderSide),
        child: Center(
          child: widget.child
        ),
      ),
    );
  }
}
