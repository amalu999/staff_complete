import 'package:flutter/material.dart';
import 'package:staff_deco/customhistory.dart';
import 'package:staff_deco/history.dart';
import 'package:staff_deco/pricechange.dart';

import 'feedback.dart';
import 'settings.dart';
//import 'history.dart';
class MenuBar extends StatefulWidget {
  @override
  _MenuBarState createState() => _MenuBarState();
}

class _MenuBarState extends State<MenuBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
            image: DecorationImage(
            image: NetworkImage("https://st.depositphotos.com/2815327/3510/v/600/depositphotos_35105363-stock-video-abstract-blue-background-with-vertical.jpg"),
        alignment: Alignment.topCenter,
              fit: BoxFit.fill ,
      ),
    ),
                accountName: Text('MACE'),
                accountEmail: Text('myprintings@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  child: Text('MACE'),
                  backgroundColor: Colors.white,

                ),
              ),


              ListTile(
                  leading: Icon(Icons.attach_money),
                  title: Text('Price Change'),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => pricechange(),
                    ),);
                  }
              ),
              ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Account logout'),
                  onTap: (){Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Settings(),
                  ),);

                  }
              ),
              ListTile(
                  leading: Icon(Icons.feedback),
                  title: Text('feedback'),
                  onTap: (){Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => feedback(),
                  ),);

                  }
              ),
              ListTile(
                  leading: Icon(Icons.history),
                  title: Text('history'),
                  onTap: (){Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => history(),
                  ),);

                  }
              ),
              ListTile(
                  leading: Icon(Icons.history),
                  title: Text('custom history'),
                  onTap: (){Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => customhistory(),
                  ),);

                  }
              ),
            ]
        ),
      ),
    );

  }
}
