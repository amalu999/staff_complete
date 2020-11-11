import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'menubar.dart';

class feedback extends StatefulWidget {
  @override
  _feedbackState createState() => _feedbackState();
}

class _feedbackState extends State<feedback> {
  void customLaunch(command) async{
    if(await canLaunch(command)){
      await launch(command);
    }else{print('could not launch $command');}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          brightness: Brightness.dark,

          title: Text("FEEDBACK",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),

          backgroundColor: Colors.blueGrey[900],
          ),

        endDrawer: MenuBar(),
        body:Center(

          child: SizedBox(
            height: 100,
            child: Column(
              children: <Widget>[
                Center(
                  child: Card(

                    child: Container(
                        child:Text("send your feedback",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                    ),
                  ),
                ),
                Card(
                  child: Container(
                      child:Card(
                        child: RaisedButton(
                          child: Text('MAIL'),
                          color: Colors.blueGrey,
                          onPressed:(){
                            customLaunch('mailto:amalususanb@gmail.com');
                          } ,

                        ) ,)
                  ),
                )
              ],
            ),
          ),
        )

    );
  }
}