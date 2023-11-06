import 'dart:io';

class DummyModel {
  final String name;
  final String quantity;
  final String location;
  final String category;
  final String brand;
  final int model;
  final File image;
  bool isSelected;
 

  DummyModel( {
    required this.name,
    required this.quantity,
    required this.location,
    required this.category,
    required this.brand,
    required this.model,
    required this.image,
    this.isSelected = false,
  });
}
