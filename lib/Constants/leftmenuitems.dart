class LeftMenuItems { 
  final String name; 
  final String icon; 
  
  LeftMenuItems({required this.name, required this.icon});
}

List<LeftMenuItems> leftMenuItems = [
  LeftMenuItems(name: 'DashBoard', icon: 'Images/dashboard.png'),  
  LeftMenuItems(name: 'Calendar', icon: 'Images/calendar.png'),  
  LeftMenuItems(name: 'Items', icon: 'Images/box.png'),  
  LeftMenuItems(name: 'Users', icon: 'Images/group.png'),  
  LeftMenuItems(name: 'Reservation', icon: 'Images/book.png'),  
  LeftMenuItems(name: 'Report', icon: 'Images/report.png'), 
  
]; 