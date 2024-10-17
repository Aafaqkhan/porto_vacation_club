import 'package:intl/intl.dart';

class CDateFormat {
  static String getDate(DateTime date) =>
      DateFormat('y MM dd').format(date).replaceAll(' ', '');
  static String fullDate(DateTime date) =>
      DateFormat('EEE, d MMM y    hh:mm a').format(date);
  static String amPm(DateTime date) => DateFormat('a').format(date);
  static String hourTime(DateTime date) => DateFormat('HH:mm').format(date);
  static String monthYear(DateTime date) => DateFormat('MMMM y').format(date);
  static DateTime parsetoDate(String formattedDate) =>
      DateFormat("yyyy-MM-dd hh:mm:ss").parse(formattedDate);
}
