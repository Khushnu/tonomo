import 'package:flutter/material.dart';
import 'package:tonomo/Screens/dashboard_screen.dart';

class PageState extends ChangeNotifier{
  Widget _pageName=const DashBoardScreen();
  // LeftMenuItems _currenSelected = leftMenuItems[0];
  int currentSelect=0; 
  // bool get isSlect => _isSlect;
  // LeftMenuItems get leftMenu => _currenSelected;
  Widget get pageName=>_pageName;

  set updatePage(Widget pName){
    _pageName=pName;
    notifyListeners();
  }

  //  set updateSelect(LeftMenuItems left){
  //  _isSlect = _currenSelected == left; 
  //   notifyListeners();
  // }
}