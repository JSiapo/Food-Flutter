extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }

  String twoNumber() {
    return "${this.length < 2 ? '0' : ''}${this}";
  }

  DateTime strDate() {
    List<String> arr = this.split('-');
    return DateTime.parse("${arr[2]}${arr[1]}${arr[0]}");
  }
}

extension DateTimeExtension on DateTime {
  String dateStr() {
    return "${this.day.toString().twoNumber()}-${this.month.toString().twoNumber()}-${this.year}";
  }
}
