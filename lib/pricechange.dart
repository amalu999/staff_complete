import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'homepage.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'menubar.dart';

class pricechange extends StatefulWidget {
  @override
  _pricechangeState createState() => _pricechangeState();
}

class _pricechangeState extends State<pricechange> {

  TextEditingController newctrl;
  void processing=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newctrl = new TextEditingController();

  }

  void edit() async{

    setState(() {
      processing = true;
    });

    var url ="https://designproject---eprint.000webhostapp.com/pricechange.php";

    var data = {
      "new":newctrl.text,

    };
    var res = await http.post(url,body:data);
    if(jsonDecode(res.body) == "true"){
      Fluttertoast.showToast(msg: "updated",toastLength: Toast.LENGTH_SHORT);}
    else{

      Fluttertoast.showToast(msg: "error",toastLength: Toast.LENGTH_SHORT);
    }

    setState(() {
      processing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          brightness: Brightness.dark,

          title: Text("UPDATE PRICE",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),

          backgroundColor: Colors.blueGrey[900],
        ),
        endDrawer: MenuBar(),

        backgroundColor: Colors.white,
        body: Container(


            child: Column(
              children: <Widget>[
                TextField(
                  controller: newctrl,
                  decoration: InputDecoration(prefixIcon: Icon(Icons.account_box,color: Colors.blueGrey ,),

                      hintText: 'new rate',),
                  keyboardType: TextInputType.numberWithOptions(),
                  style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
                ),
                RaisedButton(
                    child: Text("edit"),
                    onPressed: () {edit();}
                ),

              ],),
          )

    );
  }

}