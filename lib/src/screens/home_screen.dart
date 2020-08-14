import 'package:flutter/material.dart';
import 'package:food_app/src/models/day.dart';
import 'package:food_app/src/models/user.dart';

import 'package:food_app/src/widgets/calendar_widget.dart';
import 'package:food_app/src/widgets/chipCalendar_widget.dart';
import 'package:food_app/src/widgets/header_widget.dart';

class HomePage extends StatelessWidget {
  final User user = User();
  HomePage() {
    user.avatar =
        // 'https://www.westernunion.com/content/dam/wu/jm/responsive/send-money-in-person-from-jamaica-resp.png';
        'https://cdn.pixabay.com/photo/2016/03/09/09/30/girl-1245835_960_720.jpg';
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
          ChipCalendar(Day(dateTime: '14-08-2020')),
        ],
      ),
    );
  }
}
