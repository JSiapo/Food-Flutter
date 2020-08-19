import 'package:flutter/material.dart';
import 'package:food_app/src/models/day.dart';
import 'package:food_app/src/models/user.dart';

import 'package:food_app/src/widgets/calendar_widget.dart';
import 'package:food_app/src/widgets/chipCalendar_widget.dart';
import 'package:food_app/src/widgets/foodSwipper_widget.dart';
import 'package:food_app/src/widgets/header_widget.dart';

class HomePage extends StatelessWidget {
  final User user = User();
  HomePage() {
    user.avatar =
        // 'https://www.westernunion.com/content/dam/wu/jm/responsive/send-money-in-person-from-jamaica-resp.png';
        'https://cdn.pixabay.com/photo/2016/03/09/09/30/girl-1245835_960_720.jpg';
    // 'https://3.bp.blogspot.com/-NAGz3r9a1ZA/XLM60xge2hI/AAAAAAAABR8/KmiboleQ_3QSJnaBc7Vck9JOTQJ9n0l7wCK4BGAYYCw/s120-pf/Programmer.png';
    user.userName = 'Amie Carrie';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              Header(user: user),
              CalendarHorizontal(),
              ChipCalendar(Day(dateTime: '20-08-2020')),
              FoodSwipper(),
            ]),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .centerDocked, //specify the location of the FAB
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber[700],
        onPressed: () {},
        child: Container(
          margin: EdgeInsets.all(15.0),
          child: Icon(Icons.add),
        ),
        elevation: 4.0,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          margin: EdgeInsets.only(left: 12.0, right: 12.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                onPressed: () {},
                iconSize: 27.0,
                icon: Icon(
                  Icons.assessment,
                  color: Colors.grey,
                ),
              ),
              //to leave space in between the bottom app bar items and below the FAB
              SizedBox(
                width: 50.0,
              ),
              IconButton(
                onPressed: () {},
                iconSize: 27.0,
                icon: Icon(
                  Icons.settings,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        //to add a space between the FAB and BottomAppBar
        shape: CircularNotchedRectangle(),
        //color of the BottomAppBar
        color: Colors.white,
      ),
    );
  }
}
