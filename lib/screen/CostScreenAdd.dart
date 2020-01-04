import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:building/dialog/CustomDialog.dart';
import 'package:building/model/Unit.dart';
class CostScreenAdd extends StatefulWidget {
  CostScreenAdd({Key key}) : super(key: key);

  @override
  _CostScreenAdd createState() => _CostScreenAdd();
}

class _CostScreenAdd extends State<CostScreenAdd> {
  bool _active = false;
  Unit unitDb=new Unit();

  FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();
    _loadAnimals();
    myFocusNode = FocusNode();
  }
   List<String> _animals = <String>['CATTLE', 'SHEEP', 'GOAT'];
  String _animal;
  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();

    super.dispose();
  }


  _loadAnimals() async {
    // gets data from sqflite
    List<String> loadedAnimals = await unitDb.getUnitName();
    _animals.clear();
    setState(() {
      // converts sqflite row data to List<String>, updating state
      _animals = loadedAnimals;
    });
  }

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
              controller: name,focusNode: myFocusNode,
              textAlign: TextAlign.center,
              decoration: InputDecoration(

                  hintText: 'عنوان'
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top:5),
            ),
            TextField(
              textAlign: TextAlign.center,
              controller: unit,
              decoration: InputDecoration(
                  hintText: 'قیمت واحد'
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top:5),
            ),FormField<String>(
              builder: (FormFieldState<String> state) {
                return InputDecorator(

                  decoration: InputDecoration(
                    labelText: 'Animal Type',
                    errorText: state.hasError ? state.errorText : null,
                  ),
                  isEmpty: _animal == '',
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _animal,
                      isDense: true,
                      onChanged: (String newValue) {
                        setState(() {
                       /*   assessHed.asAnimal = newValue;*/
                          _animal = newValue;
                          state.didChange(newValue);
                        });
                      },
                      items: _animals.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Container(child:Text(value ,textAlign: TextAlign.right,),color: Colors.red,),
                        );
                      }).toList(),
                    ),
                  ),
                );
              },
              validator: (val) {
                //return val != 'SUMMARY' ? 'DETAIL' : 'Please select Type';
                return null;
              },
            ),
            Container(
              padding: EdgeInsets.only(top:5,left:5,right:5),
              child:RaisedButton(child: Text("تایید",style: TextStyle(color: Colors.black,fontSize:18 ),),
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0),

                ),
                onPressed: (){
                 if(name.text.length>0 && unit.text.length>0)
                   {
                  unitDb.insert(new Unit(name:name.text,unit:unit.text )).then((value){
                    if(value>0)
                    {showDialog(
                      context: context,
                      builder: (BuildContext context) => CustomDialog(
                        title: "ذخیره اطلاعات",
                        description:
                        " اطلاعات مورد نظر با موفقیت ذخیره گردید",
                        buttonText: "تایید",
                      ),
                    );}
                  });}
                 else
                   {
                     final snackBar = SnackBar(
                       content: Text('Yay! A SnackBar!'),
                       action: SnackBarAction(
                         label: 'Undo',
                         onPressed: () {
                           // Some code to undo the change.
                         },
                       ),
                     );


                     Scaffold.of(context).showSnackBar(snackBar);}
                  /*if(>-1)
                       {
                        *//* showDialog(
                           context: context,
                           builder: (BuildContext context) => CustomDialog(
                             title: "ذخیره اطلاعات",
                             description:
                             " اطلاعات مورد نظر با موفقیت ذخیره گردید",
                             buttonText: "تایید",
                           ),
                         );*//*
                       }*/


                },),
            ),
            Container(
              padding: EdgeInsets.only(left:5,right:5),
              child:RaisedButton(child: Text("انصراف",style: TextStyle(color: Colors.black,fontSize:18 ),),
                  onPressed: (){
                    name.text="";
                    unit.text="";
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