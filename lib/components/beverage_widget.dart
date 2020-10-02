import 'package:cocoloko/models/beverage.dart';
import 'package:cocoloko/utilities/network_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BeverageWidget extends StatefulWidget {
  final Beverage beverage;
  BeverageWidget(this.beverage);

  @override
  _BeverageWidgetState createState() => _BeverageWidgetState();
}

class _BeverageWidgetState extends State<BeverageWidget> {
  Beverage _beverage;
  NetworkUtil _util;

  @override
  void initState() {
    super.initState();
    _util = NetworkUtil();
  }

  Widget projectWidget() {
    return FutureBuilder(
        future: _util.getById(widget.beverage.id),
        initialData: [],
        builder: (context, projectSnap) {
          if (projectSnap.data is Beverage) {
            print(projectSnap.data.runtimeType);
            _beverage = projectSnap.data;
            return Image.network(_beverage.imageUrl);
          } else {
            return CircularProgressIndicator();
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return projectWidget();
  }
}
