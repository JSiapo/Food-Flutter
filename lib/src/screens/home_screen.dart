import 'package:flutter/material.dart';
import 'package:food_app/src/models/user.dart';

import 'package:food_app/src/widgets/calendar_widget.dart';
import 'package:food_app/src/widgets/header_widget.dart';

class HomePage extends StatelessWidget {
  final User user = User();
  HomePage() {
    user.avatar =
        'https://static01.nyt.com/images/2019/11/17/books/review/17Salam/Salam1-superJumbo.jpg';

    user.userName = 'Amie Carrie';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        child: Column(
          children: <Widget>[
            Header(user: user),
            // ignore: todo
            // TODO Add Page view to swipe all screen to change day
            CalendarHorizontal(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10.0),
                  child: Chip(
                    label: Text('Hoy'),
                    backgroundColor: Colors.green,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
