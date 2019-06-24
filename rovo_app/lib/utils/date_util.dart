import 'package:intl/intl.dart';

/*
/// Check format date-time: https://pub.dev/documentation/intl/latest/intl/DateFormat-class.html
*/
class DateUtil{
  static String timeFormat(DateTime date){
    try{
      return DateFormat.jm().format(date.toLocal());
    }catch(e){
      return date.toString();
    }
  }

  static String dateFormat(DateTime date){
    try{
      return DateFormat("EEE, MMM d").format(date.toLocal());
    }catch(e){
      return date.toString();
    }
  }

  static bool differenceDay(DateTime a, DateTime b) {
    if (a.year != b.year)
      return true;
    else if (a.month != b.month)
      return true;
    else if (a.day != b.day) return true;
    return false;
  }


}