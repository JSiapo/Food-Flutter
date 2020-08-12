import 'package:flutter/material.dart';
import 'package:food_app/src/models/day.dart';
import 'package:food_app/src/providers/day_provider.dart';

class CalendarHorizontal extends StatelessWidget {
  // final int daysLimit;
  final List<Day> days = List<Day>();
  final DayProvider dayProvider = DayProvider();

  CalendarHorizontal();

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    final PageController _pageViewController = PageController(
      initialPage: 8,
      viewportFraction: 0.16,
    );
    return Container(
      margin: EdgeInsets.only(top: 5.0),
      height: _screenSize.height * 0.14,
      width: double.infinity,
      child: FutureBuilder(
        future: dayProvider.getDays(),
        builder: (BuildContext context, AsyncSnapshot<List<Day>> snapshot) {
          if (snapshot.hasData) {
            return PageView(
              // pageSnapping: false, //* Imantado
              controller: _pageViewController,
              children: _cardDay(snapshot.data),
            );
          }
          return Container(
            child: Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }

  List<Widget> _cardDay(List<Day> dias) {
    String month = 'Ago';
    String nameDay = 'Mié';
    String number = '12';
    return dias
        .map(
          (e) => GestureDetector(
            onTap: () {
              print(e);
            },
            child: Container(
              margin: EdgeInsets.only(
                  right: 10.0,
                  top: (e.number == number &&
                          e.nameDay == nameDay &&
                          e.month == month)
                      ? 1.0
                      : 10.0,
                  bottom: (e.number == number &&
                          e.nameDay == nameDay &&
                          e.month == month)
                      ? 1.0
                      : 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: (e.number == number &&
                        e.nameDay == nameDay &&
                        e.month == month)
                    ? Colors.amber[700]
                    : Colors.white10,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: (e.number == number &&
                            e.nameDay == nameDay &&
                            e.month == month)
                        ? 1.0
                        : 10.0,
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
