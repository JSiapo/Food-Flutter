extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }

  String twoNumber() {
    return "${this.length < 2 ? '0' : ''}${this}";
  }
}

extension DateTimeExtension on DateTime {
  String strDate() {
    return "${this.day.toString().twoNumber()}-${this.month.toString().twoNumber()}-${this.year}";
  }
}
