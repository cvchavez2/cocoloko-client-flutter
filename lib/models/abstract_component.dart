import 'package:cocoloko/models/abstract_model.dart';

class AbstractComponent extends AbstractModel {
  double price;

  AbstractComponent(int id, String name, this.price) : super(id, name);
}
