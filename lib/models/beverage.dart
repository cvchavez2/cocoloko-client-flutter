import 'package:cocoloko/models/abstract_component.dart';

import 'ingredient.dart';

class Beverage extends AbstractComponent {
  String imageUrl;
  List<Ingredient> ingredients;

  Beverage(int id, String name, double price, this.imageUrl, this.ingredients)
      : super(id, name, price);
}
