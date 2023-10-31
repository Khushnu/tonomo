import 'package:flutter/material.dart';
import 'package:tonomo/Constants/colors.dart';

class DashBoardContainerWidget extends StatefulWidget {
  const DashBoardContainerWidget(
      {super.key,
      required this.title,
      this.height,
      this.width,
      this.child});

  final String title;
  final double? height;
  final double? width;
  final Widget? child;

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
          BoxShadow(color: Colors.grey , offset: Offset(2, -1), blurRadius: 2.4)
        ],
        border: Border.all(color: Colors.grey.withOpacity(0.4))
      ),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(widget.title),
          ), 
          const Divider(thickness: 2,), 
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
