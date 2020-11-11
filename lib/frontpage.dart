import 'package:flutter/material.dart';

import 'menubar.dart';
class Frontpage extends StatefulWidget {
  @override
  _FrontpageState createState() => _FrontpageState();
}

class _FrontpageState extends State<Frontpage> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("EPRINT"),
            centerTitle: true
        ),
    //    drawer: MenuBar(),
        body: Column(
          children: <Widget>[
            //  Image(
            //   image: NetworkImage('https://www.google.com/imgres?imgurl=https://img.freepik.com/free-vector/professional-office-copier-multifunction-printer-printing-paper-documents-isolated-vector-illustration-printer-copier-machine-office-work_53562-6147.jpg?size%3D626%26ext%3Djpg&imgrefurl=https://www.freepik.com/free-photos-vectors/copier&tbnid=kLwatrIHpAGdDM&vet=1&docid=c7WH9cejiv24HM&w=626&h=512&source=sh/x/im'),
            //   ),
            SizedBox(height: 80,),
            Card(
              child: ListTile(
                title: Text('TEXTBOOKS'),
                leading: const Icon(Icons.assignment),
                trailing: Icon(Icons.visibility),
                onTap: () {
              //    Navigator.of(context).push(MaterialPageRoute(
                //    builder: (context) => Textbook(),
                  //),);
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text('CUSTOM TEXTBOOKS'),
                leading: const Icon(Icons.assignment),
                trailing: Icon(Icons.visibility),
                onTap: () {
                //  Navigator.of(context).push(MaterialPageRoute(
                  //  builder: (context) =>   CustomTextBook(),
               //   ),);
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text('TO COLLECT'),
                leading: const Icon(Icons.assignment_turned_in),
                trailing: Icon(Icons.visibility),
                onTap: () {
             //     Navigator.of(context).push(MaterialPageRoute(
              //      builder: (context) => collect(),)
              //    );
             },
              ),
            ),
            Card(
              child: ListTile(
                title: Text('TO COLLECT(custom)'),
                leading: const Icon(Icons.assignment_turned_in),
                trailing: Icon(Icons.visibility),
                onTap: () {
              //    Navigator.of(context).push(MaterialPageRoute(
              //      builder: (context) => Customcollect(),)
              //    );
              },
              ),
            ),

            Card(
              child: ListTile(
                title: Text('History'),
                leading: const Icon(Icons.assignment_turned_in),
                trailing: Icon(Icons.visibility),
                onTap: () {
              //    Navigator.of(context).push(MaterialPageRoute(
              //      builder: (context) => history(),)
             //    );
              },
              ),
            ),

            Card(
              child: ListTile(
                title: Text('History(custom)'),
                leading: const Icon(Icons.assignment_turned_in),
                trailing: Icon(Icons.visibility),
                onTap: () {
             //   Navigator.of(context).push(MaterialPageRoute(
             //     builder: (context) => customhistory(),)
            //     );
                },
              ),
            ),],)
    );

  }
}





