import 'package:flutter/material.dart';
import 'package:food_app/src/models/day.dart';
import 'package:intl/intl.dart'; //for date format
import 'package:intl/date_symbol_data_local.dart';

class CalendarHorizontal extends StatelessWidget {
  final int daysLimit;
  final List<Day> days = List<Day>();

  CalendarHorizontal({@required this.daysLimit});
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    final _screenSize = MediaQuery.of(context).size;
    days.add(Day(month: "Ago", number: '04', nameDay: 'Mar', key: 0));
    days.add(Day(month: "Ago", number: '05', nameDay: 'Mie', key: 1));
    days.add(Day(month: "Ago", number: '06', nameDay: 'Jue', key: 2));
    days.add(Day(month: "Ago", number: '07', nameDay: 'Vie', key: 3));
    days.add(Day(month: "Ago", number: '08', nameDay: 'Sáb', key: 4));
    days.add(Day(month: "Ago", number: '09', nameDay: 'Dom', key: 5));
    days.add(Day(month: "Ago", number: '10', nameDay: 'Lun', key: 6));
    days.add(Day(month: "Ago", number: '11', nameDay: 'Mar', key: 7));
    days.add(Day(month: "Ago", number: '12', nameDay: 'Mie', key: 8));
    days.add(Day(month: "Ago", number: '13', nameDay: 'Jue', key: 9));
    days.add(Day(month: "Ago", number: '14', nameDay: 'Vie', key: 10));
    days.add(Day(month: "Ago", number: '15', nameDay: 'Sáb', key: 11));
    days.add(Day(month: "Ago", number: '16', nameDay: 'Dom', key: 12));
    days.add(Day(month: "Ago", number: '18', nameDay: 'Lun', key: 13));
    days.add(Day(month: "Ago", number: '19', nameDay: 'Mar', key: 14));
    days.add(Day(month: "Ago", number: '20', nameDay: 'Mie', key: 15));
    days.add(Day(month: "Ago", number: '21', nameDay: 'Jue', key: 16));
    return Container(
      // color: Colors.amber,
      margin: EdgeInsets.only(top: 5.0),
      height: _screenSize.height * 0.14,
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
          (e) => GestureDetector(
            onTap: () {
              DateTime now = DateTime.now();
              DateFormat formatter = DateFormat.EEEE('es_ES');
              String formatted = formatter.format(now);
              print(formatted);
            },
            child: Container(
              margin: EdgeInsets.only(
                  right: 10.0,
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
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(e.nameDay),
                ],
              ),
            ),
          ),
        )
        .toList();
  }
}
