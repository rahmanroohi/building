import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:building/dialog/CustomDialog.dart';
import 'package:building/model/Unit.dart';
class UnitScreenAdd extends StatelessWidget {
  /*UnitScreenAdd({Key key}) : super(key: key);

  @override
  _UnitScreenAdd createState() => _UnitScreenAdd();
}

class _UnitScreenAdd extends State<UnitScreenAdd> {*/
  bool _active = false;
  Unit unitDb=new Unit();

  FocusNode myFocusNode;



  final name = TextEditingController();
  final unit = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build


    @override
    void initState() {
      initState();

      myFocusNode = FocusNode();
    }

    @override
    void dispose() {
      // Clean up the focus node when the Form is disposed.
      myFocusNode.dispose();

      dispose();
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        body: ListView(
          children: <Widget>[
            TextField(
              controller: name, focusNode: myFocusNode,
              textAlign: TextAlign.center,
              decoration: InputDecoration(

                  hintText: 'نام'
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5),
            ),
            TextField(
              textAlign: TextAlign.center,
              controller: unit,
              decoration: InputDecoration(
                  hintText: 'واحد'
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 5, left: 5, right: 5),
              child: RaisedButton(child: Text(
                "تایید", style: TextStyle(color: Colors.black, fontSize: 18),),
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0),

                ),
                onPressed: () {
                if(name.text.trim().length>0)
                  unitDb.insert(new Unit(name: name.text, unit: unit.text))
                      .then((value) {
                    if (value > 0) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            CustomDialog(
                              title: "ذخیره اطلاعات",
                              description:
                              " اطلاعات مورد نظر با موفقیت ذخیره گردید",
                              buttonText: "تایید",
                            ),
                      );
                    }
                  });
                  /*if(>-1)
                       {
                        */ /* showDialog(
                           context: context,
                           builder: (BuildContext context) => CustomDialog(
                             title: "ذخیره اطلاعات",
                             description:
                             " اطلاعات مورد نظر با موفقیت ذخیره گردید",
                             buttonText: "تایید",
                           ),
                         );*/ /*
                       }*/


                },),
            ),
            Container(
              padding: EdgeInsets.only(left: 5, right: 5),
              child: RaisedButton(child: Text(
                "انصراف", style: TextStyle(color: Colors.black, fontSize: 18),),
                  onPressed: () {
                    name.text = "";
                    unit.text = "";
                    FocusScope.of(context).requestFocus(myFocusNode);
                  }, shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),

                  )),
            )
          ],
        ),
      ),);
  }
}