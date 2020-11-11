import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'menubar.dart';




class history extends StatefulWidget {
  @override
  _historyState createState() => _historyState();
}

class _historyState extends State<history> {

  void setValues(ID) async {
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    // set values

    sharedPrefs.setString('ord', ID);
    print('Values Set in Shared Prefs!!');
  }

  Future getData(url) async {
    //String theUrl='https://designproject---eprint.000webhostapp.com/orderdisplay.php';
    var res = await http.get(
        Uri.encodeFull(url), headers: {"Accept": "application/json"});
    if (res.statusCode == 200) {
      var responseBody = json.decode(res.body);
      print(responseBody);
      return responseBody;
    }
    else {
      print(res.statusCode);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          brightness: Brightness.dark,

          title: Text("HISTORY ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),

          backgroundColor: Colors.blueGrey[900],

        ),
        endDrawer: MenuBar(),
        body: FutureBuilder(
            future: getData(
                'https://designproject---eprint.000webhostapp.com/historydisplay.php'),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              List snap = snapshot.data;
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text('Error fetching data'));
              }
              return ListView.builder(
                  itemCount: snap.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text("${snap[index]['NAME']}"),
                        subtitle: Text("ordered by ${snap[index]['STUDENT']}"),
                      ),
                    );
                  });
            }
        )

    );
  }
}