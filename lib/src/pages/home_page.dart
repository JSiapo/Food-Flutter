import 'package:flutter/material.dart';

import 'package:food_app/src/widgets/calendar_widget.dart';
import 'package:food_app/src/widgets/header_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Header(),
              // ignore: todo
              // TODO Add Page view to swipe all screen to change day
              CalendarHorizontal(
                daysLimit: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
