import 'package:timeago/timeago.dart' as timeago;

class ArMessages implements timeago.LookupMessages {
  @override
  String aboutAMinute(int minutes) => 'دقيقة واحدة';
  @override
  String aboutAMonth(int days) => 'شهر واحد';
  @override
  String aboutAnHour(int minutes) => 'ساعة واحدة';
  @override
  String aboutAYear(int year) => 'سنة واحدة';

  @override
  String aDay(int hours) => 'يوم واحد';
  @override
  String days(int days) {
    if (days == 1) {
      return 'يوم واحد';
    }
    if (days == 2) {
      return 'يومين';
    }
    return '$days أيام';
  }

  @override
  String hours(int hours) {
    if (hours == 1) {
      return 'ساعة واحدة';
    }
    if (hours == 2) {
      return 'ساعتين';
    }
    return '$hours ساعات';
  }

  @override
  String lessThanOneMinute(int seconds) => 'لحظات';
  @override
  String minutes(int minutes) {
    if (minutes == 1) {
      return 'دقيقة واحدة';
    }
    if (minutes == 2) {
      return 'دقيقتين';
    }
    if (minutes < 11) {
      return '$minutes دقائق';
    }
    return '$minutes دقيقة';
  }

  @override
  String months(int months) {
    if (months == 1) {
      return 'شهر واحد';
    }
    if (months == 2) {
      return 'شهرين';
    }
    return '$months أشهر';
  }

  @override
  String prefixAgo() => 'منذ';
  @override
  String prefixFromNow() => 'بعد';
  @override
  String suffixAgo() => '';
  @override
  String suffixFromNow() => '';
  @override
  String wordSeparator() => ' ';
  @override
  String years(int years) {
    if (years == 1) {
      return 'سنة واحدة';
    }
    if (years == 2) {
      return 'سنتين';
    }
    return '$years سنوات';
  }
}
