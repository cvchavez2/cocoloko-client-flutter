import 'package:cocoloko/components/beverage_widget.dart';
import 'package:cocoloko/models/beverage.dart';
import 'package:cocoloko/utilities/network_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BeverageListWidget extends StatefulWidget {
  @override
  _BeverageListWidgetState createState() => _BeverageListWidgetState();
}

class _BeverageListWidgetState extends State<BeverageListWidget> {
  NetworkUtil _util;
  List<Beverage> _beverageList;

  @override
  void initState() {
    super.initState();
    _util = NetworkUtil();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _util.get(),
        initialData: [],
        builder: (context, projectSnap) {
          if (projectSnap.data is List<Beverage>) {
            print(projectSnap.data.runtimeType);
            _beverageList = projectSnap.data;
            return CarouselSlider(
              options: CarouselOptions(
                height: 400.0,
                autoPlay: false,
              ),
              items: _beverageList.map((beverage) {
                return Builder(
                  builder: (BuildContext context) {
                    return BeverageWidget(beverage);
//            return Container(
//                width: MediaQuery.of(context).size.width,
//                margin: EdgeInsets.symmetric(horizontal: 5.0),
//                decoration: BoxDecoration(color: Colors.amber),
//                child: Text(
//                  'text $i',
//                  style: TextStyle(fontSize: 16.0),
//                ));
                  },
                );
              }).toList(),
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
