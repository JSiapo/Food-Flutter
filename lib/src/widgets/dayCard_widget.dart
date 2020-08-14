import 'package:flutter/material.dart';
import 'package:food_app/src/models/day.dart';

class DayCard extends StatelessWidget {
  final Day day;
  final bool isSelected;
  DayCard(this.day, this.isSelected);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(day.dateTime);
      },
      child: Container(
        margin: EdgeInsets.only(
            right: 10.0,
            top: isSelected ? 1.0 : 10.0,
            bottom: isSelected ? 1.0 : 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: isSelected ? Colors.amber[700] : Colors.white10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: isSelected ? 1.0 : 10.0,
            ),
            Text(day.month),
            SizedBox(
              height: 5.0,
            ),
            Text(
              day.number,
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(day.nameDay),
          ],
        ),
      ),
    );
  }
}
