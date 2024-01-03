import 'package:flutter/material.dart';
import 'package:tonomo/Services/dummymodel.dart';
import 'package:tonomo/Services/dummyreservation.dart';

class StateManagement  extends ChangeNotifier{

 List<DummyReservation> reserVationList = []; 
 List<DummyModel> itemList =[];
List<DummyModel> totalItemList =[];
List<DummyReservation> totalReservation =[];


List<DummyModel> get _itemList => itemList;

List<DummyModel> get _totalItemList => totalItemList;

 List<DummyReservation> get _reservationList => reserVationList;
 List<DummyReservation> get _toralreser => totalReservation;


 addReserVation(DummyReservation dummyReservation){
  reserVationList.add(dummyReservation); 
  totalReservation.add(dummyReservation);
  notifyListeners();
 }

addItem(DummyModel dummyModel){
  itemList.add(dummyModel);
  totalItemList.add(dummyModel);
  notifyListeners();
}

removeItem(DummyModel dummyModel){
  totalItemList.remove(dummyModel);
  itemList.remove(dummyModel);
  notifyListeners();
}

removeReservation(DummyReservation index){
  reserVationList.remove(index); 
  totalReservation.remove(index); 
  notifyListeners();
}


searchReservation(String? searchTex){
  if(searchTex == null || searchTex.isEmpty){
   
    reserVationList = totalReservation.toList();
  } else {
  //  itemList.where((element) => element.name.toLowerCase().contains(searchTex.toLowerCase())).toList(); 
   reserVationList = totalReservation.where((element) => (element.name.toLowerCase()).contains(searchTex.toLowerCase())).toList(); 
  }notifyListeners();
}
searchInItems(String? searchTex){
  if(searchTex == null || searchTex.isEmpty){
   itemList=totalItemList.toList();
  } else {
 itemList= totalItemList.where((element) => (element.name.toLowerCase()).contains(searchTex.toLowerCase())).toList(); 
  // filteredReservation = reserVationList.where((element) => element.name.toLowerCase().contains(searchTex.toLowerCase())).toList(); 
  }notifyListeners();
}

sort(String columnName, bool asscending){
  switch (columnName){
    case 'name':
  itemList.sort((a, b) {
    if(asscending){
      return a.name.compareTo(b.name);
    } else {
      return b.name.compareTo(a.name);
    }

  },
  );
  break;
  
  case 'model':
  itemList.sort((a, b) {
    if(asscending){
      return b.model.compareTo(a.model);
    } else {
      return a.model.compareTo(a.model);
    }
  },
  );
  break; 
   case 'quantity':
  itemList.sort((a, b) => int.parse(b.quantity).compareTo(int.parse(a.quantity)),
  );
  break;
}
notifyListeners();
}


sortReserVation(String columnName, bool asscending){
  switch (columnName){
    case 'name':
  reserVationList.sort((a, b) {
    if(asscending){
      return a.name.compareTo(b.name);
    } else {
      return b.name.compareTo(a.name);
    }
  },
  );
  break;
  case 'from':
  reserVationList.sort((a, b) => b.from.compareTo(a.from),
  );
  break; 
   case 'to':
  reserVationList.sort((a, b) => b.to.compareTo(a.to),
  );
  break; 
  case 'user':
  reserVationList.sort((a, b) => b.user.compareTo(a.user),
  );
  break;
}
notifyListeners();
}
}