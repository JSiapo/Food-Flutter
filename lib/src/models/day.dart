import 'package:flutter/cupertino.dart';

class Day {
  String month;
  String number;
  String nameDay;
  int key;
  Day(
      {@required this.month,
      @required this.number,
      @required this.nameDay,
      @required this.key});
  @override
  String toString() {
    return "$nameDay $number de $month";
  }
}
