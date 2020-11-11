import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class collectDetails extends StatefulWidget {
  final String nameOfBook;
  final String author;
  final String subject;
  final String copies;
  final String price;
  final String amount;
  final String student;
  final String phn;
  final String admno;
  final String ord;


  const collectDetails({Key key,this.ord,this.subject, this.nameOfBook, this.author, this.copies, this.price, this.amount, this.student, this.phn, this.admno}) : super(key: key);

  @override
  _collectDetailsState createState() => _collectDetailsState();
}

class _collectDetailsState extends State<collectDetails> {

  var processing = false;
  var ordId;

  void getValues() async {
    print('Getting Values from shared Preferences');
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    ordId = sharedPrefs.getString('ord');
    print('user_name: $ordId');
  }


  void markasprint() async {
    setState(() {
      processing = true;
    });

    var url = "https://designproject---eprint.000webhostapp.com/collect.php";

    var data = {
      "ord_id": ordId,

    };
    var res = await http.post(url, body: data);
    if (jsonDecode(res.body) == "true") {
      Fluttertoast.showToast(
          msg: "Item collected", toastLength: Toast.LENGTH_SHORT);
    }
    else {
      Fluttertoast.showToast(msg: "error", toastLength: Toast.LENGTH_SHORT);
    }

    setState(() {
      processing = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getValues();
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,

        title: Text("DETAILS",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),

        backgroundColor: Colors.blueGrey[900],

      ),
      body: Container(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 20,),


                  RichText(
                    text: TextSpan(
                        text: "STUDENT NAME:   ",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),
                        children: [
                          TextSpan(text: widget.student, style: TextStyle(
                            fontWeight: FontWeight.normal,
                              color: Colors.blueGrey
                          ))
                        ]
                    ),
                  ),
                  SizedBox(height: 20,),
                  RichText(
                    text: TextSpan(
                        text: "STUDENT PHONE NO:   ",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),

                       children: [

                         TextSpan(text: widget.phn, style: TextStyle(
                            fontWeight: FontWeight.normal,
                              color: Colors.blueGrey
                          ),
                          ),

                        ]
                    ),

                  ),
                  Center(
                    child: Row(children: <Widget>[
                      Center(
                        child: RaisedButton(
                            child: Center(child: Icon(Icons.phone)),
                            color: Colors.blueGrey,
                            onPressed:() {}

                        ),
                      ),
                      SizedBox(width: 40,),
                    ]),
                  ),
                  //Center(child: Icon(Icons.phone,color: Colors.blueGrey,),),

                  RichText(
                    text: TextSpan(
                        text: "STUDENT ADMISSION NO:   ",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),
                        children: [
                          TextSpan(text: widget.admno, style: TextStyle(
                            fontWeight: FontWeight.normal,
                              color: Colors.blueGrey
                          ))
                        ]
                    ),
                  ),
                  SizedBox(height: 20,),

                  /*  SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("SUBJECT :",style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontWeight: FontWeight.bold)),
                ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.subject),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("BOOKNAME :",style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(fontWeight: FontWeight.bold)),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:Text(widget.nameOfBook),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("AUTHOR :",style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.author),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("NO OF COPIES :",style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(fontWeight: FontWeight.bold)),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.copies),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("PRICE :",style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(fontWeight: FontWeight.bold)),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.price),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("AMOUNT:",style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(fontWeight: FontWeight.bold)),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.amount),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("STUDENT NAME:",style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(fontWeight: FontWeight.bold)),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.student),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("STUDENT PHONE NO:",style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(fontWeight: FontWeight.bold)),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.phn),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("STUDENT ADMISSION NO",style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(fontWeight: FontWeight.bold)),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.admno),
                    ),

                    Row(children: <Widget>[
                    RaisedButton(
                      child: Text("READ"),
                      onPressed:(){
                        //_launchInBrowser(url);
                      }, ),*/

                  RichText(
                    text: TextSpan(
                        text: "SUBJECT:   ",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),
                        children: [
                          TextSpan(text: widget.subject, style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.blueGrey
                          ))
                        ]
                    ),
                  ),
                  SizedBox(height: 20,),
                  RichText(
                    text: TextSpan(
                        text: "NAME OF BOOK:   ",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),
                        children: [
                          TextSpan(text: widget.nameOfBook, style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.blueGrey
                          ))
                        ]
                    ),
                  ),
                  SizedBox(height: 20,),
                  RichText(
                    text: TextSpan(
                        text: "AUTHOR:   ",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),
                        children: [
                          TextSpan(text: widget.author, style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.blueGrey
                          ))
                        ]
                    ),
                  ),
                  SizedBox(height: 20,),
                  RichText(
                    text: TextSpan(
                        text: "NO OF COPIES:   ",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),
                        children: [
                          TextSpan(text: widget.copies, style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.blueGrey
                          ))
                        ]
                    ),
                  ),
                  SizedBox(height: 20,),
                /*  RichText(
                    text: TextSpan(
                        text: "PRICE:   ",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),
                        children: [
                          TextSpan(text: widget.price, style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.blueGrey
                          ))
                        ]
                    ),
                  ),
                  SizedBox(height: 20,),*/
                  RichText(
                    text: TextSpan(
                        text: "AMOUNT:   ",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),
                        children: [
                          TextSpan(text: widget.amount, style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.blueGrey
                          ))
                        ]
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(children: <Widget>[
                    RaisedButton(
                        child: Icon(Icons.check),
        color: Colors.blueGrey,
                    onPressed:() {markasprint();}

                    ),
                    SizedBox(width: 40,),
                  ])
                ],)
              ,),
          )
      ),


    );
  }
}

