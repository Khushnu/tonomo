import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tonomo/Constants/colors.dart';
import 'package:tonomo/Provider/pagenavigations.dart';
import 'package:tonomo/Screens/dashboard_screen.dart';
import 'package:tonomo/Widgets/leftside_menu_widget.dart';
import 'package:tonomo/Widgets/topbar_widget.dart';
import 'package:tonomo/main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double widthExpanded = 0;
  double centerContainerExpandedWidth =0;
  bool isExpanded = true;
  bool isContainerOpen = false; 
  Widget selectedPage=const DashBoardScreen();

  
  changePage(Widget child){
    setState(() {
      selectedPage=child;
    });
  }
  expandedFunction(){
    setState(() {
      isExpanded =!isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) { 
    screenHeight = MediaQuery.sizeOf(context).height; 
    screenWidth = MediaQuery.sizeOf(context).width;  
    widthExpanded = isExpanded ? screenWidth * 0.1 + 60 : screenWidth * 0.1 - 101 ; 
    centerContainerExpandedWidth = isExpanded ? screenWidth * 0.9 - 90 :screenWidth * 0.9 + 70   ; 
    return  Scaffold(
      backgroundColor: AllColors.kMainbackgorundColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Align( 
            alignment: Alignment.topLeft,
            child: TopBarWidget()),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 60).copyWith(bottom: 10),
          child: Align(
            alignment: Alignment.topLeft,
             child:  
                   LeftSideMenuWidgett(
                    leftContinerHegit: screenHeight,
                    leftContainerWidth: widthExpanded, 
                    isExpanded: isExpanded,
                    bottomNameButton: (){
                      setState(() {
                        isContainerOpen = !isContainerOpen;
                      });
                    },
                    ontap: (){ 
                      setState(() {
                      });
                    }, onExpand: expandedFunction, 
                    changePage: changePage, 
                    isBottomMenu: isContainerOpen, 
                   ),
             ),
        ), 
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 60).copyWith(bottom: 20),
          child: Align( 
            alignment: Alignment.topRight, 
            child: Container(
              height: screenHeight , 
              width: centerContainerExpandedWidth , 
             decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), 
              color: AllColors.kDashboardBackground
             ),
             child: context.watch<PageState>().pageName,
            ),
          ),
        )
      ],)
    );
  }
}

