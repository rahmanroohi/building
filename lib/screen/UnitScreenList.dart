import 'package:building/model/Unit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UnitScreenList extends StatefulWidget {
  UnitScreenList({Key key}) : super(key: key);

  @override
  _UnitScreenList createState() => _UnitScreenList();
}

class _UnitScreenList extends State<UnitScreenList> {
  bool _active = false;
  Unit unitDb = new Unit();
  String filter;
  List<Unit> unitList;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: SafeArea(
            child: Scaffold(
      body: FutureBuilder<List<Unit>>(
        future: unitDb.getUserModelData(filter),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());

          return Column(
            children: <Widget>[
              Container(
                alignment: Alignment.topRight,
                margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
                child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextField(
                      onChanged: (value) {
                        filter=value;
                      },
                      /* controller: editingController,*/
                      decoration: InputDecoration(
                          labelText: "جستجو",
                          hintText: "جستجو",
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.0)))),
                    )),
              ),
              Expanded(
                  child: ListView(
                children: snapshot.data
                    .map((user) => filter == null || filter == "" ?Card(
                            child: ListTile(
                          title: Container(
                              margin: EdgeInsets.only(bottom: 5),
                              child: Text(
                                user.name,
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              )),
                          subtitle: Text(
                            user.unit,
                            textAlign: TextAlign.right,
                          ),
                        )):new Container())
                    .toList(),
              ))
            ],
          );
        },
      ),
    )));
  }
}
