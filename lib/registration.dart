import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import 'frontpage.dart';
import 'homepage.dart';


class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  bool signin = true;

  TextEditingController emailctrl, passctrl;

  bool processing = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailctrl = new TextEditingController();
    passctrl = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          padding: EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Icon(Icons.account_circle, size: 200, color: Colors.white,),

                boxUi(),
              ],
            ),
          )
      ),
    );
  }



  void userSignIn() async {
    setState(() {
      processing = true;
    });

    var url = "https://designproject---eprint.000webhostapp.com/signinstaff.php";
    var data = {
      "email": emailctrl.text,
      "pass": passctrl.text,
    };

    var res = await http.post(url, body: data);

    if (jsonDecode(res.body) == "true") {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>HomeScreen(),
      ),);
    }
    else {
      if (jsonDecode(res.body) == "false") {
        Fluttertoast.showToast(
            msg: "incorrect password", toastLength: Toast.LENGTH_SHORT);
      }
      else {
        print(jsonDecode(res.body));
      }
    }

    setState(() {
      processing = false;
    });
  }


  Widget boxUi() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: emailctrl,
              decoration: InputDecoration(prefixIcon: Icon(Icons.account_box,),
                  hintText: 'email'),
              keyboardType:TextInputType.emailAddress,
            ),


            TextField(
              controller: passctrl,
              decoration: InputDecoration(prefixIcon: Icon(Icons.lock,),
                  hintText: 'pass'),
            ),

            SizedBox(height: 10.0,),

            MaterialButton(
                onPressed: () => userSignIn(),
                child: processing == false ? Text('Sign In',
                  style: GoogleFonts.varelaRound(fontSize: 18.0,
                      color: Colors.black),) : CircularProgressIndicator(
                  backgroundColor: Colors.red,)

            ),

          ],
        ),
      ),
    );
  }
}





