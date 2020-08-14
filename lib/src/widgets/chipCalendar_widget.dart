import 'package:flutter/material.dart';
import 'package:food_app/helpers/extensions.dart';
import 'package:food_app/helpers/timeAgo.dart';
import 'package:food_app/src/models/day.dart';

class ChipCalendar extends StatelessWidget {
  final Day day;
  ChipCalendar(this.day);
  @override
  Widget build(BuildContext context) {
    var hoy = DateTime.now().dateStr().strDate();
    var otherDate = day.dateTime.strDate();
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.only(right: 10.0),
          child: Chip(
            label: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(timeAgo(otherDate.difference(hoy).inDays).capitalize()),
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
    );
  }
}
