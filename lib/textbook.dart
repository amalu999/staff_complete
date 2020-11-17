import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'orderdetails.dart';


class Textbook extends StatefulWidget {
  @override
  _TextbookState createState() => _TextbookState();
}

class _TextbookState extends State<Textbook> {

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
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            brightness: Brightness.dark,

            title: Text("ORDER FOR BOOKS",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),

            backgroundColor: Colors.blueGrey[900],
          ),
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
              future: getData(
                  'https://designproject---eprint.000webhostapp.com/orderdisplay.php'),
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
                        color: Colors.white,
                        child: ListTile(
                          title: Text("${snap[index]['NAME']}"),
                          subtitle: Text("ordered by ${snap[index]['STUDENT']}"),
                          trailing: Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            setState(() {
                              setValues('${snap[index]['ID']}');
                              takeOrder(
                                  "${snap[index]['ID']}",
                                  "${snap[index]['MAIL']}",
                                  "${snap[index]['SUBJECT']}",
                                  "${snap[index]['NAME']}",
                                  "${snap[index]['AUTHOR']}",
                                  "${snap[index]['COPIES']}",
                                  "${snap[index]['PRICE']}",
                                  "${snap[index]['AMOUNT']}",
                                  "${snap[index]['STUDENT']}",
                                  "${snap[index]['PHN']}",
                                  "${snap[index]['ADMNO']}",
                              "${snap[index]['URL']}");
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

  void takeOrder(ID,mail,sub, nam, auth, copy, pri, amo, std, phone, adno,url) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) =>
          OrderDetails(
            ord :ID,
            mail:mail,
            subject: sub,
            nameOfBook: nam,
            author: auth,
            copies: copy,
            price: pri,
            amount: amo,
            student: std,
            phn: phone,
            admno: adno,
          url: url),
    ),);
  }
}