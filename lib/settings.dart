import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:staff_deco/pricechange.dart';

import 'homepage.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'main.dart';
import 'menubar.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          brightness: Brightness.dark,

          title: Text("SETTINGS",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),

          backgroundColor: Colors.blueGrey[900],
        ),

        backgroundColor: Colors.white,
        body:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ListTile(
                  leading: Icon(Icons.info),
                  title: Text('Price Change'),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => pricechange(),
                    ),);
                  }
              ),
              ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text('Logout',style: TextStyle(color: Colors.blue),),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MyApp()
                    ),);
                  }
              ),
            ],
          ),
        )

    );
  }
}
