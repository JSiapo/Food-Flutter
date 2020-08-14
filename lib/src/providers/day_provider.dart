import 'dart:async';

//* Date format ⌛
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:food_app/helpers/extensions.dart';

import 'package:food_app/src/models/day.dart';
import 'package:food_app/src/constants.dart';

class DayProvider {
  bool _cargando = false;
  List<Day> _days = List();
  int _dayRefresh = 31;
  int dayCount = 0;
  int _dayStart = -8;

  // final _dayStreamController = StreamController<List<Day>>.broadcast();

  // Function(List<Day>) get daySink => _dayStreamController.sink.add;

  // Stream<List<Day>> get dayStream => _dayStreamController.stream;

  // void disposeStream() {
  //   _dayStreamController?.close();
  // }

  DayProvider() {
    initializeDateFormatting();
  }

  Future<List<Day>> getDays() async {
    if (_cargando) return [];

    _cargando = true;
    dayCount += _dayRefresh;
    // initializeDateFormatting();
    DateFormat formatterName = DateFormat.EEEE(Language);
    DateFormat formatterNumber = DateFormat.d(Language);
    DateFormat formatterMonth = DateFormat.MMM(Language);

    for (var i = _dayStart; i < dayCount; i++) {
      DateTime dateTime = DateTime.now().add(
        new Duration(days: i),
      );
      _days.add(
        Day(
          dateTime: dateTime.dateStr(),
          month: formatterMonth.format(dateTime).substring(0, 3).capitalize(),
          nameDay: formatterName.format(dateTime).substring(0, 3).capitalize(),
          number: formatterNumber.format(dateTime).twoNumber(),
        ),
      );
      print(_days.last);
    }

    // daySink(_days);
    _dayStart = dayCount + 1;

    _cargando = false;
    return _days;
  }
}
