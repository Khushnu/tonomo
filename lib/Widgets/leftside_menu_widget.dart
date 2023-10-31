// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:tonomo/Constants/colors.dart';
import 'package:tonomo/Constants/leftmenuitems.dart';
import 'package:tonomo/Screens/calendar_screen.dart';
import 'package:tonomo/Screens/dashboard_screen.dart';
import 'package:tonomo/Screens/items_screen.dart';
import 'package:tonomo/Screens/reservation_screen.dart';
import 'package:tonomo/Screens/users_screen.dart';
import 'package:tonomo/main.dart';

class LeftSideMenuWidgett extends StatefulWidget {
  const LeftSideMenuWidgett(
      {super.key,
      required this.leftContinerHegit,
      required this.leftContainerWidth,
      this.isExpanded = true,
      required this.ontap,
      required this.onExpand,
      required this.changePage});

  final double leftContinerHegit;
  final double leftContainerWidth;
  final bool isExpanded;
  final Function() ontap;
  final Function() onExpand;
  final Function(Widget) changePage;
  @override
  State<LeftSideMenuWidgett> createState() => _LeftSideMenuWidgettState();
}

class _LeftSideMenuWidgettState extends State<LeftSideMenuWidgett> {
  var currentSlected = leftMenuItems[0];
  Widget seltedP = const DashBoardScreen();

  @override
  void initState() {
    super.initState();
    currentSlected = leftMenuItems[0];
  }

  @override
  Widget build(BuildContext context) {
    bool isExpanded = widget.isExpanded;
    // screenHeight = MediaQuery.sizeOf(context).height;
    // screenWidth = MediaQuery.sizeOf(context).width;
    return Container(
      height: widget.leftContinerHegit,
      width: widget.leftContainerWidth,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: widget.onExpand,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    isExpanded
                        ? 'Images/minimize.png'
                        : 'Images/fullscreen.png',
                    height: 23,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(isExpanded ? 'Close Panel' : '', style: const TextStyle(fontSize: 15, fontFamily: 'Inter'),)
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            thickness: 1,
            color: Colors.grey,
            endIndent: 15,
            indent: 15,
          ),
          SizedBox(
            height: screenHeight * 0.3 + 30,
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: leftMenuItems.length,
                itemBuilder: (_, index) {
                  bool isSelected = currentSlected == leftMenuItems[index];
                  var data = leftMenuItems[index];
                  return Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: GestureDetector(
                      onTap: () {
                        if (leftMenuItems[index] == leftMenuItems[0]) {
                          widget.changePage(DashBoardScreen(
                            expandedWidth:
                                isExpanded ? screenWidth + 40 : screenWidth,
                          ));
                        } else if (leftMenuItems[index] == leftMenuItems[1]) {
                          widget.changePage(CalendarScreen(
                            width: isExpanded ? screenWidth : screenWidth,
                          ));
                        } else if (leftMenuItems[index] == leftMenuItems[2]) {
                          widget.changePage(const ItemScreen());
                        } else if (leftMenuItems[index] == leftMenuItems[3]) {
                          widget.changePage(const UserScreen());
                        } else if (leftMenuItems[index] == leftMenuItems[4]) {
                          widget.changePage(const ReservationScreen());
                        } else {
                          widget.changePage(const Text('error'));
                        }
                        setState(() {
                          currentSlected = leftMenuItems[index];
                        });
                      },
                      child: Container(
                        height: 45,
                        width: isExpanded ? 100 : 40,
                        decoration: BoxDecoration(
                            color: isSelected
                                ? AllColors.kLeftMenuSelectionColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 15,
                              ),
                              Image.asset(
                                data.icon,
                                height: 25,
                                color: isSelected ? Colors.white : Colors.black,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                isExpanded ? data.name : '',
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 15,
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            thickness: 1,
            color: Colors.grey,
            endIndent: 15,
            indent: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                width: 15,
              ),
              const Icon(Icons.settings),
              const SizedBox(
                width: 15,
              ),
              Text(
                isExpanded ? 'Settings' : '',
                style: const TextStyle(fontSize: 15),
              )
            ],
          )
        ],
      ),
    );
  }
}