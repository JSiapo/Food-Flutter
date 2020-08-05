import 'package:flutter/material.dart';
import 'package:food_app/src/models/day.dart';

class CalendarHorizontal extends StatelessWidget {
  final int daysLimit;
  final List<Day> days = List<Day>();
  CalendarHorizontal({@required this.daysLimit});
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    days.add(Day(month: "Abr", number: '04', nameDay: 'Mar', key: 0));
    days.add(Day(month: "Abr", number: '05', nameDay: 'Mie', key: 1));
    days.add(Day(month: "Abr", number: '06', nameDay: 'Jue', key: 2));
    days.add(Day(month: "Abr", number: '07', nameDay: 'Vie', key: 3));
    days.add(Day(month: "Abr", number: '08', nameDay: 'Sáb', key: 4));
    days.add(Day(month: "Abr", number: '09', nameDay: 'Dom', key: 5));
    days.add(Day(month: "Abr", number: '10', nameDay: 'Lun', key: 6));
    days.add(Day(month: "Abr", number: '11', nameDay: 'Mar', key: 7));
    return Container(
      // color: Colors.amber,
      margin: EdgeInsets.only(top: 5.0),
      height: _screenSize.height * 0.15,
      width: double.infinity,
      child: PageView(
        controller: PageController(
          initialPage: 2,
          viewportFraction: 0.18,
        ),
        children: _dates(days, 0),
      ),
    );
  }

  List<Widget> _dates(List<Day> dias, int keyDay) {
    return dias
        .map(
          (e) => Container(
            margin: EdgeInsets.only(
                right: 15.0,
                top: e.key == keyDay ? 1.0 : 10.0,
                bottom: e.key == keyDay ? 1.0 : 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: e.key == keyDay ? Colors.amber[700] : Colors.white10,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: e.key == keyDay ? 1.0 : 10.0,
                ),
                Text(e.month),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  e.number,
                  style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(e.nameDay),
              ],
            ),
          ),
        )
        .toList();
  }
}
