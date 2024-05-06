
import 'package:intl/intl.dart';

class DateTimeUtils {
  static Map<String, dynamic> parseDateTime(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    String day = DateFormat('dd').format(dateTime);
    String month = DateFormat('MM').format(dateTime);
    String hour = DateFormat('hh').format(dateTime);
    String minute = DateFormat('mm').format(dateTime);
    String amPm = DateFormat('a').format(dateTime);

    String arabicAmPm = amPm == 'AM' ? 'ص' : 'م';

    return {
      'day': day,
      'month': month,
      'hour': hour,
      'minute': minute,
      'amPm': arabicAmPm,
    };
  }
}