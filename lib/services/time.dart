class TimeHelper {
  static DateTime getDateTime(String timestamp) {
    return DateTime.parse(timestamp);
  }

  static DateTime getCurrentDateTime() {
    return DateTime.now();
  }
}
