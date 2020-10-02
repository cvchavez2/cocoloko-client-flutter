import 'package:cocoloko/models/abstract_component.dart';

class Ingredient {
  int id;
  String name;
  double price;
  int beverageId;

  Ingredient(this.id, this.name, this.price, this.beverageId);
//  Ingredient(int id, String name, double price, this.beverageId)
//      : super(id, name, price);
}
