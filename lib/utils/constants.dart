
class Constants {
  static const pageSize = 10;
  static const kLogEnable = true;
  static const kLogTag = '[ORO Safe]';
  static String listEndMessage = 'It looks like you\'ve reached the end';
  static String appVersion = '1.0.0';
  static DateTime selectedDate = DateTime.now();
  static String pushToken = '';


  static DateTime get deliveryDate => DateTime(
      selectedDate.year, selectedDate.month, selectedDate.day, 00, 00, 00);
  static Map<String, dynamic> commonParams = <String, dynamic>{};
  static Map<String, dynamic> headers = <String, dynamic>{};
  static double defaultLatitude = -34.930466;
  static double defaultLongitude = 138.596260;
  static bool showSkipLoginButton = false;
}
