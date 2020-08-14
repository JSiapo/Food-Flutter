class Day {
  String month;
  String number;
  String nameDay;
  String dateTime;

  Day({this.month, this.number, this.nameDay, this.dateTime});
  @override
  String toString() {
    return "$nameDay $number $month";
  }
}
