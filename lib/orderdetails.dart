import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'textbook.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
class OrderDetails extends StatefulWidget {
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
  final String mail;
  final url;

  const OrderDetails({Key key,this.ord,this.subject, this.nameOfBook, this.author, this.copies, this.price, this.amount, this.student, this.phn, this.admno,this.mail, this.url}) : super(key: key);

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {

  var processing=false;
  var ordId;
  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }
  void getValues() async {
    print('Getting Values from shared Preferences');
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    ordId= sharedPrefs.getString('ord');
    print('user_name: $ordId');


  }



  void markasprint() async{

    setState(() {
      processing = true;
    });

    var url ="https://designproject---eprint.000webhostapp.com/print.php";

    var data = {
      "ord_id":ordId,

    };
    var res = await http.post(url,body:data);
    if(jsonDecode(res.body) == "true"){
      Fluttertoast.showToast(msg: "Marked as Printed",toastLength: Toast.LENGTH_SHORT);}
    else{

      Fluttertoast.showToast(msg: "error",toastLength: Toast.LENGTH_SHORT);
    }

    setState(() {
      processing = false;
    });
  }



  final String _subjectController = "order ready";




  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> send() async {
    final Email email = Email(
      body: "Your order $ordId, ${widget.nameOfBook} by ${widget.author} is ready.Your total is ${widget.amount}.PLEASE COLLECT ASAP  ",
      subject: _subjectController,
      recipients: [widget.mail],
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'success';
    } catch (error) {
      platformResponse = error.toString();
    }

    if (!mounted) return;

    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(platformResponse),
    ));
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

        title: Text("BOOK DETAILS",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),

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
                        text: "SUBJECT:   ",
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),
                        children: [
                          TextSpan(text: widget.subject,style: TextStyle(
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
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),
                        children: [
                          TextSpan(text: widget.nameOfBook,style: TextStyle(
                              fontWeight: FontWeight.normal,color: Colors.blueGrey
                          ))
                        ]
                    ),
                  ),
                  SizedBox(height: 20,),
                  RichText(
                    text: TextSpan(
                        text: "AUTHOR:   ",
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),
                        children: [
                          TextSpan(text: widget.author,style: TextStyle(
                              fontWeight: FontWeight.normal,color: Colors.blueGrey
                          ))
                        ]
                    ),
                  ),
                  SizedBox(height: 20,),
                  RichText(
                    text: TextSpan(
                        text: "NO OF COPIES:   ",
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),
                        children: [
                          TextSpan(text: widget.copies,style: TextStyle(
                              fontWeight: FontWeight.normal,color: Colors.blueGrey
                          ))
                        ]
                    ),
                  ),
                  SizedBox(height: 20,),
                  RichText(
                    text: TextSpan(
                        text: "PRICE:   ",
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),
                        children: [
                          TextSpan(text: widget.price,style: TextStyle(
                              fontWeight: FontWeight.normal,color: Colors.blueGrey
                          ))
                        ]
                    ),
                  ),
                  SizedBox(height: 20,),
                  RichText(
                    text: TextSpan(
                        text: "AMOUNT:   ",
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),
                        children: [
                          TextSpan(text: widget.amount,style: TextStyle(
                              fontWeight: FontWeight.normal,color: Colors.blueGrey
                          ))
                        ]
                    ),
                  ),
                  SizedBox(height: 20,),
                  RichText(
                    text: TextSpan(
                        text: "STUDENT NAME:   ",
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),
                        children: [
                          TextSpan(text: widget.student,style: TextStyle(
                              fontWeight: FontWeight.normal,color: Colors.blueGrey
                          ))
                        ]
                    ),
                  ),
                  SizedBox(height: 20,),
                  RichText(
                    text: TextSpan(
                        text: "STUDENT PHONE NO:   ",
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),
                        children: [
                          TextSpan(text: widget.phn,style: TextStyle(
                              fontWeight: FontWeight.normal,color: Colors.blueGrey
                          ))
                        ]
                    ),
                  ),

                  SizedBox(height: 20,),
                  RichText(
                    text: TextSpan(
                        text: "STUDENT ADMISSION NO:   ",
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),
                        children: [
                          TextSpan(text: widget.admno,style: TextStyle(
                              fontWeight: FontWeight.normal,color: Colors.blueGrey
                          ))
                        ]
                    ),
                  ),

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
                  SizedBox(width: 30,),
                  Row(children: <Widget>[
                    RaisedButton(
                        child: Icon(Icons.print),
                        color: Colors.blueGrey,
                        onPressed:() {markasprint();
                        send();}
                    ),
                    SizedBox(width: 40,),
                    RaisedButton(child:Icon(Icons.chrome_reader_mode),
                        color: Colors.blueGrey,
                        onPressed:(){
                          _launchInBrowser(widget.url);
                        } )
                  ],)
                ],),
            )
        ),
      ),

    );

  }


}
