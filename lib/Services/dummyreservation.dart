class DummyReservation {
  final String name;
  final DateTime from;
  final DateTime to;
  final String duration;
  final String user;
  final String items;
  bool isSelected;

  DummyReservation(
      {required this.name,
      required this.from,
      required this.to,
      required this.duration,
      required this.user,
      required this.items, 
      this.isSelected = false});
}

List<DummyReservation> reservationList =[
  
];