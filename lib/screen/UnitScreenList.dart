import 'package:building/model/Unit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:building/screen/UnitScreenAdd.dart';

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
          _data=snapshot.data;


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
                        onSearchTextChanged(value);
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
                children:filter == null || filter == "" ? _data
                    .map((user) => Card(
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
                        )))
                    .toList():_searchResult
                    .map((user) => Card(
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
                    )))
                    .toList(),
              ))
            ],
          );
        },
      ),floatingActionButton: FloatingActionButton(
              onPressed: () {
                // Add your onPressed code here!
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UnitScreenAdd()),
                );
              },
              child: Icon(Icons.add),
              backgroundColor: Colors.green,
            ),
    )));
  }

  List<Unit> _searchResult=new List<Unit>();
  List<Unit> _data;
  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    _data.forEach((userDetail) {
      if (userDetail.name.contains(text) || userDetail.unit.contains(text))
        _searchResult.add(userDetail);
    });

    setState(() {});
  }


}
