//import 'package:intl/intl.dart'; //for date format

// class Days {
//   List<Day> items = List<Day>();
// }

class Day {
  String month;
  String number;
  String nameDay;
  DateTime dateTime;
  // int key;
  // Day({this.month, this.number, this.nameDay, this.key});
  Day({this.month, this.number, this.nameDay, this.dateTime});
  @override
  String toString() {
    return "$nameDay $number de $month";
  }
}
