import 'package:flutter/material.dart';
import 'package:tonomo/Services/dummymodel.dart';
import 'package:tonomo/Services/dummyreservation.dart';

class StateManagement  extends ChangeNotifier{

final List<DummyReservation> reserVationList = []; 
final List<DummyModel> itemList =[];


List<DummyModel> get _itemList => itemList;
 List<DummyReservation> get _reservationList => reserVationList;


 addReserVation(DummyReservation dummyReservation){
  reserVationList.add(dummyReservation); 
  notifyListeners();
 }

addItem(DummyModel dummyModel){
  itemList.add(dummyModel);
  notifyListeners();
}

removeItem(int index){
  itemList.removeAt(index);
  notifyListeners();
}

removeReservation(int index){
  reserVationList.removeAt(index); 
  notifyListeners();
}

}