import 'dart:async';
import 'package:intl/intl.dart'; //for date format
import 'package:intl/date_symbol_data_local.dart';
import 'package:food_app/helpers/extensions.dart';
import 'package:food_app/src/models/day.dart';
import 'package:food_app/src/constants.dart';

class DayProvider {
  bool _cargando = false;
  List<Day> days = List();
  int _dayRefresh = 10;
  int dayCount = 0;
  int _dayStart = -6;

  // final _dayStreamController = StreamController<List<Day>>.broadcast();

  // Function(List<Day>) get daySink => _dayStreamController.sink.add;

  // Stream<List<Day>> get dayStream => _dayStreamController.stream;

  // void disposeStream() {
  //   _dayStreamController?.close();
  // }

  Future<List<Day>> getDays() async {
    initializeDateFormatting();
    if (_cargando) {
      print('Aún cargando ....');
      return [];
    }
    print('Función');
    _cargando = true;
    dayCount += _dayRefresh;
    //
    DateFormat formatterName = DateFormat.EEEE(Language);
    DateFormat formatterNumber = DateFormat.d(Language);
    DateFormat formatterMonth = DateFormat.MMM(Language);
    print('Antes de for');

    for (var i = _dayStart; i < dayCount; i++) {
      DateTime dateTime = DateTime.now().add(new Duration(days: i));
      String formattedName = formatterName.format(dateTime);
      String formattedNumber = formatterNumber.format(dateTime);
      String formattedMonth = formatterMonth.format(dateTime);
      print(
          '-> ${formattedName.substring(0, 3).capitalize()} - $formattedNumber - ${formattedMonth.capitalize().substring(0, 3)} - $i');
      days.add(Day(
          dateTime: dateTime,
          month: formattedMonth.capitalize().substring(0, 3),
          nameDay: formattedName.substring(0, 3).capitalize(),
          number: formattedNumber));
      _dayStart = i + 1;
    }
    //
    print('Siguiente es $_dayStart / ${dayCount + _dayRefresh}');
    // daySink(days);
    _cargando = false;
    return days;
  }
}
