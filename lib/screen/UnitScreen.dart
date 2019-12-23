import 'package:flutter/material.dart';

class UnitScreen extends StatefulWidget {
  UnitScreen({Key key}) : super(key: key);

  @override
  _UnitScreen createState() => _UnitScreen();
}

class _UnitScreen extends State<UnitScreen> {
  bool _active = false;

  final name = TextEditingController();
  final unit = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: Scaffold(
          body: ListView(
            children: <Widget>[
              TextField(
                controller: name,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'نام'
                ),
              ),
              TextField(
                controller: unit,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'واحد'
                ),
              )
            ],
          ),
        ),);
  }

}