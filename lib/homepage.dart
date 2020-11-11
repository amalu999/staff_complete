import 'package:flutter/material.dart';
import 'package:staff_deco/collect.dart';
import 'package:staff_deco/customcollect.dart';
import 'package:staff_deco/customtextbook.dart';
import 'package:staff_deco/menubar.dart';
import 'package:staff_deco/reading_card_list.dart';
import 'package:staff_deco/text_book.dart';
import 'package:staff_deco/textbook.dart';
//import 'package:book_app/widgets/two_side_rounded_button.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      endDrawer: MenuBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://st.depositphotos.com/2815327/3510/v/600/depositphotos_35105363-stock-video-abstract-blue-background-with-vertical.jpg"),
                  alignment: Alignment.topCenter,
                  fit: BoxFit.fitWidth,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: size.height * .1),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.display1,
                        children: [
                          TextSpan(text: "WORKS FOR "),
                          TextSpan(
                              text: "today?",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        ReadingListCard(

                          title: "TEXTBOOK",

                          pressDetails: () {
                         Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Textbook();
                                },
                              ),


                      );
                         },
                        ),
                        ReadingListCard(

                          title: "CUSTOM TEXTBOOK",
                          pressDetails: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return CustomTextBook();
                                },
                              ),
                            );
                          },
                        ),
                        SizedBox(width: 30),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                            style: Theme.of(context).textTheme.display1,
                            children: [
                              TextSpan(text: "Students to "),
                              TextSpan(
                                text: "collect",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: <Widget>[
                              ReadingListCard(

                                title: "TO COLLECT",

                                pressDetails: () {
                                     Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return collect();
                                },
                              ),
                           );
                         },
                              ),
                              ReadingListCard(
                                title: "TO COLLECT CUSTOM  ",
                                pressDetails: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return Customcollect();
                                      },
                                    ),
                                  );
                              },

                              ),
                              SizedBox(width: 30),
                            ],
                          ),
                        ),
                        SizedBox(height: 40),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}