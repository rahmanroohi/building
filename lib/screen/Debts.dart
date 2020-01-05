import 'package:flutter/material.dart';

import '../SizeConfig.dart';


class Debts extends StatefulWidget {


  _Debts createState() => _Debts();
}
class _Debts extends State<Debts> {
  String dropdownValue = 'One';
  List <String> spinnerItems = [] ;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);


    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(

        appBar: AppBar(iconTheme: IconThemeData(color: Colors.blue),
          backgroundColor:Colors.lightBlueAccent,
          elevation: 0.3,
        ),

        body: ListView(
        children: <Widget>[

          Row(
           children: <Widget>[

             //Row One

             Container(

               height: SizeConfig.blockSizeVertical * 5,
               width: SizeConfig.blockSizeHorizontal * 60,
               child:DropdownButton<String>(

                 value: dropdownValue,
                 icon: Icon(Icons.arrow_drop_down),
                 iconSize: 24,
                 elevation: 16,
                 style: TextStyle(color: Colors.red, fontSize: 18),
                 underline: Container(
                   height: 2,
                   color: Colors.deepPurpleAccent,
                 ),
                 onChanged: (String data) {
                   setState(() {
                     dropdownValue = data;
                   });
                 },

                 items: spinnerItems.map<DropdownMenuItem<String>>((String value) {
                   return DropdownMenuItem<String>(
                     value: value,
                     child: Text(value),
                   );
                 }).toList(),
               ),

               ),
             Container(
               height: SizeConfig.blockSizeVertical * 5,
               width: SizeConfig.blockSizeHorizontal * 20,
               alignment: Alignment.topRight,
               child: Text('عنوان',style: TextStyle(fontFamily: 'IRANSansMobile.ttf'),),
             ),


         ],
          ),
          //Row Two
        Row(
          children: <Widget>[


             Container(
               height: SizeConfig.blockSizeVertical * 5,
               width: SizeConfig.blockSizeHorizontal * 60,
              child: TextField(
                 textAlign: TextAlign.center,
                 style: TextStyle(color: Colors.cyan),
                 cursorColor: Colors.cyan,
                 decoration: InputDecoration(
                   hintText: "ریال",

                   hintStyle: TextStyle(fontStyle: FontStyle.italic,color: Colors.teal),
                   focusedBorder: UnderlineInputBorder(
                     borderSide: BorderSide(color: Colors.cyan,width: 2.0),
                   ),

                   enabledBorder: const UnderlineInputBorder(
                     borderSide: const BorderSide(color: Colors.cyanAccent, width: 2.0),
                   ),
                 ),

               ),

             ),
            Container(
              height: SizeConfig.blockSizeVertical * 5,
              width: SizeConfig.blockSizeHorizontal * 20,

              child: Text('مبلغ',style: TextStyle(fontFamily: 'IRANSansMobile.ttf'),),
            ),
            ],),
                //Row Tree
          Row(
            children: <Widget>[

             Container
               (
               height: SizeConfig.blockSizeVertical * 5,
               width: SizeConfig.blockSizeHorizontal * 60,
               child: TextField(
                 textAlign: TextAlign.center,
                 style: TextStyle(color: Colors.cyan),
                 cursorColor: Colors.cyan,
                 decoration: InputDecoration(
                   hintText: "عدد",

                   hintStyle: TextStyle(fontStyle: FontStyle.italic,color: Colors.teal),
                   focusedBorder: UnderlineInputBorder(
                     borderSide: BorderSide(color: Colors.cyan,width: 2.0),
                   ),

                   enabledBorder: const UnderlineInputBorder(
                     borderSide: const BorderSide(color: Colors.cyanAccent, width: 2.0),
                   ),
                 ),

               ),

             ),
              Container(
                height: SizeConfig.blockSizeVertical * 5,
                width: SizeConfig.blockSizeHorizontal * 10,

                child: Text('تعداد',style: TextStyle(fontFamily: 'IRANSansMobile.ttf'),),
              ),
          ],
          ),
             //Row Four
           Row(
            children: <Widget>[

             Container(
               height: SizeConfig.blockSizeVertical * 5,
               width: SizeConfig.blockSizeHorizontal * 60,
               child: TextField(
                 textAlign: TextAlign.center,
                 style: TextStyle(color: Colors.cyan),
                 cursorColor: Colors.cyan,
                 decoration: InputDecoration(
                   hintText: "ریال",

                   hintStyle: TextStyle(fontStyle: FontStyle.italic,color: Colors.teal),
                   focusedBorder: UnderlineInputBorder(
                     borderSide: BorderSide(color: Colors.cyan,width: 2.0),
                   ),

                   enabledBorder: const UnderlineInputBorder(
                     borderSide: const BorderSide(color: Colors.cyanAccent, width: 2.0),
                   ),
                 ),

               ),

             ),
              Container(
                height: SizeConfig.blockSizeVertical * 5,
                width: SizeConfig.blockSizeHorizontal * 20,

                child: Text('جمع کل',style: TextStyle(fontFamily: 'IRANSansMobile.ttf'),),
              ),
],
          ),
             //Row Five
            Row(
            children: <Widget>[

             Container(
               height: SizeConfig.blockSizeVertical * 5,
               width: SizeConfig.blockSizeHorizontal * 60,
               child: TextField(
                 textAlign: TextAlign.center,
                 style: TextStyle(color: Colors.cyan),
                 cursorColor: Colors.cyan,
                 decoration: InputDecoration(
                   hintText: "",

                   hintStyle: TextStyle(fontStyle: FontStyle.italic,color: Colors.teal),
                   focusedBorder: UnderlineInputBorder(
                     borderSide: BorderSide(color: Colors.cyan,width: 2.0),
                   ),

                   enabledBorder: const UnderlineInputBorder(
                     borderSide: const BorderSide(color: Colors.cyanAccent, width: 2.0),
                   ),
                 ),

               ),

             ),
              Container(
                height: SizeConfig.blockSizeVertical * 5,
                width: SizeConfig.blockSizeHorizontal * 20,

                child: Text('توضیحات',style: TextStyle(fontFamily: 'IRANSansMobile.ttf'),),
              ),
          ],
          ),




             ],
             ),

      ),

    );



  }
}


