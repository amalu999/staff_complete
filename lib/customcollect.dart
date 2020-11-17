import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import 'customcollectdetails.dart';


class Customcollect extends StatefulWidget {
  @override
  _CustomcollectState createState() => _CustomcollectState();
}

class _CustomcollectState extends State<Customcollect> {


  void setValues(cID) async {
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    // set values

    sharedPrefs.setString('cord', cID);
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
    return  Scaffold(
        appBar: AppBar(
          brightness: Brightness.dark,

          title: Text("CUSTOM BOOKS TO COLLECT",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),

          backgroundColor: Colors.blueGrey[900],

        ),
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage("https://st.depositphotos.com/2815327/3510/v/600/depositphotos_35105363-stock-video-abstract-blue-background-with-vertical.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          child: FutureBuilder(
              future: getData('https://designproject---eprint.000webhostapp.com/customreadytocollectdisplay.php'),
              builder: (BuildContext context,AsyncSnapshot snapshot){
                List snap=snapshot.data;
                if(snapshot.connectionState==ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError){
                  return Center(child: Text('Error fetching data'));
                }
                return ListView.builder(
                    itemCount: snap.length,
                    itemBuilder: (context,index){
                      return Card(
                        child: ListTile(
                          title: Text("${snap[index]['NAME']}"),
                          subtitle: Text("ordered by ${snap[index]['STUDENT']}"),
                          trailing: Icon(Icons.arrow_forward_ios),
                          onTap:(){
                            setValues('${snap[index]['ID']}');
                            setState(() {

                              takeOrder("${snap[index]['SUBJECT']}","${snap[index]['NAME']}","${snap[index]['AUTHOR']}","${snap[index]['BEG']}","${snap[index]['END']}","${snap[index]['PAGES']}",
                                  "${snap[index]['COPIES']}","${snap[index]['PRICE']}","${snap[index]['AMOUNT']}","${snap[index]['STUDENT']}","${snap[index]['PHN']}","${snap[index]['ADMNO']}");


                            });

                          },


                        ),
                      );
                    });
              }
          ),
        )

    );
  }

  void takeOrder(sub,nam, auth,starting,ending,page,copy, pri, amo, std,phone, adno) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => CustomcollectDetails(subject: sub,nameOfBook: nam,author: auth,beg: starting,end: ending,pages: page,copies: copy,price: pri,amount: amo,student: std,
        phn: phone,admno: adno,),
    ),);

  }
}

