import 'package:flutter/material.dart';

import 'package:food_app/src/models/day.dart';

import 'package:food_app/src/providers/day_provider.dart';

import 'package:food_app/src/widgets/dayCard_widget.dart';

import 'package:food_app/helpers/extensions.dart';

class CalendarHorizontal extends StatelessWidget {
  final DayProvider dayProvider = new DayProvider();

  CalendarHorizontal();
  final PageController _pageViewController = PageController(
    initialPage: 10,
    viewportFraction: 0.16,
  );

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    _pageViewController.addListener(() {
      if (_pageViewController.position.pixels ==
          _pageViewController.position.maxScrollExtent) {
        _pageViewController.position.animateTo(
          _pageViewController.position.maxScrollExtent -
              _screenSize.width * 0.35,
          duration: Duration(milliseconds: 1000),
          curve: Curves.elasticOut,
        );
      }

      if (_pageViewController.position.pixels ==
          _pageViewController.position.minScrollExtent) {
        _pageViewController.position.animateTo(
          _screenSize.width * 0.3,
          duration: Duration(milliseconds: 1000),
          curve: Curves.elasticOut,
        );
      }
    });
    return Container(
      margin: EdgeInsets.only(top: 5.0),
      height: _screenSize.height * 0.14,
      width: double.infinity,
      child: FutureBuilder(
        future: dayProvider.getDays(),
        builder: (BuildContext context, AsyncSnapshot<List<Day>> snapshot) {
          if (snapshot.hasData) {
            return PageView.builder(
              // pageSnapping: false, //* Imantado
              controller: _pageViewController,
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) => DayCard(
                snapshot.data[index],
                snapshot.data[index].dateTime == DateTime.now().dateStr(),
              ),
            );
          }
          return Container(
            child: Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
