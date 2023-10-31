import 'package:flutter/material.dart';
import 'package:tonomo/Constants/colors.dart';
import 'package:tonomo/Widgets/calendar_widget.dart';
import 'package:tonomo/Widgets/calendarpagebuttons_widget.dart';
import 'package:tonomo/main.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key, required this.width});
  final double width;
  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  double  expandedWidth = 0; 
  bool isExpanded = true;
  @override
  Widget build(BuildContext context) {
     screenHeight = MediaQuery.sizeOf(context).height; 
    screenWidth = MediaQuery.sizeOf(context).width; 
    expandedWidth = isExpanded ? screenWidth * 0.6 : screenWidth * 0.8 + 74 ; 
    return Scaffold(
      backgroundColor: AllColors.kDashboardBackground,
      body: SizedBox(
        height: screenHeight, 
        width: screenWidth,
        child: Column(
          children: [
            Container(
              height: screenHeight * 0.1 - 25, 
              width: screenWidth, 
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: AllColors.kDashBoardwidget,
                boxShadow: const [BoxShadow(color: Colors.grey)],
                borderRadius: BorderRadius.circular(12), 
                border: Border.all(color: Colors.grey.shade300)
              ),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   const Text('Calendar', style: TextStyle(fontFamily: 'Inter', fontSize: 17, fontWeight: FontWeight.bold),), 
                  CalendarPageButtonWidget(height: 40, width: 120,onTap: (){
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  }, borderSide: Border.all(color: Colors.grey.shade300), borderRadius: BorderRadius.circular(12), child:  Row(mainAxisAlignment: MainAxisAlignment.center,
                   children: [ const Icon(Icons.menu), const SizedBox(width: 10,), Text(isExpanded ? 'Hide list' : 'Show list')],),), 
                  
                ],
              ),
            ), 
          const SizedBox(
            height: 20,
          ),
           CalendarWidget(isExpanded: isExpanded, expandedWidth: expandedWidth,)
            ],
        ),
      ),
    );
  }
}