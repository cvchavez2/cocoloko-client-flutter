import 'dart:convert';

import 'package:cocoloko/models/beverage.dart';
import 'package:cocoloko/models/ingredient.dart';

ResponseParser responseParser = ResponseParser();

class ResponseParser {
  List<Beverage> parseBeverageList(String jsonString) {
    try {
      final data = jsonDecode(jsonString);
      var list = data
          .map<Beverage>((map) => Beverage(
              map['id'],
              map['name'],
              map['price'].toDouble(),
              map['imageUrl'],
              map['ingredients']
                  .map<Ingredient>((ingredient) => Ingredient(
                      ingredient['id'],
                      ingredient['name'],
                      ingredient['price'].toDouble(),
                      ingredient['beverageId']))
                  .toList()))
          .toList();
      return list;
    } catch (e) {
      print('malformed json');
      throw FormatException();
    }
  }

  Beverage parseBeverageResponse(String jsonString) {
    try {
      Map<String, dynamic> map = jsonDecode(jsonString);
      var result = Beverage(
          map['id'],
          map['name'],
          map['price'].toDouble(),
          map['imageUrl'],
          map['ingredients']
              .map<Ingredient>((ingredient) => Ingredient(
                  ingredient['id'],
                  ingredient['name'],
                  ingredient['price'].toDouble(),
                  ingredient['beverageId']))
              .toList());
      return result;
    } catch (e) {
      print("malformed json");
      throw FormatException();
    }
  }
}
