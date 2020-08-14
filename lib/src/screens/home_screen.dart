import 'package:flutter/material.dart';
import 'package:food_app/src/models/user.dart';

import 'package:food_app/src/widgets/calendar_widget.dart';
import 'package:food_app/src/widgets/header_widget.dart';

class HomePage extends StatelessWidget {
  final User user = User();
  HomePage() {
    user.avatar =
        // 'https://static01.nyt.com/images/2019/11/17/books/review/17Salam/Salam1-superJumbo.jpg';
        'https://www.westernunion.com/content/dam/wu/jm/responsive/send-money-in-person-from-jamaica-resp.png';

    user.userName = 'Amie Carrie';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        children: <Widget>[
          Header(user: user),
          CalendarHorizontal(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(right: 10.0),
                child: Chip(
                  label: Row(
                    children: [
                      Text('Hoy'),
                      SizedBox(
                        width: 5.0,
                      ),
                      Icon(
                        Icons.calendar_today,
                        size: 15.0,
                      ),
                    ],
                  ),
                  // backgroundColor: Colors.green,
                ),
              ),
            ],
          )
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: Icon(Icons.add),
      //   backgroundColor: Colors.amber[700],
      // ),
    );
  }
}
