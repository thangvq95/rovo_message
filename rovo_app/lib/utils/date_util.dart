
import 'package:intl/intl.dart';

class DateUtil{
  static String dateFormat(DateTime date){
    try{
      return DateFormat("EEE, MMM d").format(date);
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