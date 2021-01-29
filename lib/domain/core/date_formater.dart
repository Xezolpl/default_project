abstract class DateFormater {
  static String formatDateToyyyyMMdd(DateTime dateTime,
      [String separator = '']) {
    return "${dateTime.year}" +
        separator +
        "${convertTimeIntToString(dateTime.month)}" +
        separator +
        "${convertTimeIntToString(dateTime.day)}";
  }

  static String formatDateToddMM(DateTime dateTime, [String separator = '']) {
    return "${convertTimeIntToString(dateTime.day)}" +
        separator +
        "${convertTimeIntToString(dateTime.month)}";
  }

  static String convertTimeIntToString(int number) {
    if (number < 10) return "0$number";
    return "$number";
  }

  static String dateToHourMinuteDayMonthFormat(DateTime date) {
    return "${convertTimeIntToString(date.hour)}:${convertTimeIntToString(date.minute)} ${convertTimeIntToString(date.day)}.${convertTimeIntToString(date.month)}";
  }

  static String dateToHourMinuteFormat(DateTime date) {
    return "${convertTimeIntToString(date.hour)}:${convertTimeIntToString(date.minute)}";
  }
}
