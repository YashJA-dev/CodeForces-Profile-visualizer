class DateConverter {
  static DateTime toDateTime(int registrationTIme) {
    return DateTime.fromMillisecondsSinceEpoch(registrationTIme * 1000);
  }
}
