import 'package:timeago/timeago.dart' as timeago;

String timeAgo(int distance) {
  final today = DateTime.now();
  if (distance < 0) {
    return timeago.format(today.subtract(Duration(days: distance * -1)),
        locale: 'es');
  }
  if (distance == 0) {
    return "Hoy";
  }

  return "Dentro de $distance día${distance > 1 ? 's' : ''}";
}
