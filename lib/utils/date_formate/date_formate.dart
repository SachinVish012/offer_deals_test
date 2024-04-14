import 'package:intl/intl.dart';

class DateFormateUtils{
  static String formatDate(String dateString) {
    DateTime date = DateTime.parse(dateString);
    String formattedDate = DateFormat('dd MMM yyyy').format(date);
    return formattedDate;
  }
}