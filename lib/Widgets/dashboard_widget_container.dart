import 'package:flutter/material.dart';
import 'package:tonomo/Constants/colors.dart';
import 'package:tonomo/main.dart';

class DashBoardContainerWidget extends StatefulWidget {
  const DashBoardContainerWidget(
      {super.key,
      required this.title,
      this.height,
      this.width,
      this.child, required this.titleColor});

  final String title;
  final double? height;
  final double? width;
  final Widget? child;
  final Color titleColor;
  @override
  State<DashBoardContainerWidget> createState() =>
      _DashBoardContainerWidgetState();
}

class _DashBoardContainerWidgetState extends State<DashBoardContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height, 
      width: widget.width, 
      decoration: BoxDecoration(
        color: AllColors.kDashBoardwidget , 
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.grey , offset: Offset(2, 2), blurRadius: 2, spreadRadius: 1)
        ],
        border: Border.all(color: Colors.grey.withOpacity(0.4))
      ),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [
          Container( 
            width: screenWidth,
            decoration: BoxDecoration(
              color: widget.titleColor,
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12))
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(widget.title, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),),
          ), 
          const Divider(thickness: 2,height: 0,), 
          Expanded(
            child: Container(
              child: widget.child,
            ),
          )
        ],
      ),
    );
  }
}
