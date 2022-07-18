import 'dart:developer' as d;
import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

import 'constants.dart';

enum kSize { small, medium, large }

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static HexColor fromJson(String json) => HexColor(json);

  static List<HexColor> fromListJson(List listJson) =>
      listJson.map((e) => HexColor.fromJson(e as String)).toList();

  String toJson() => super.value.toRadixString(16);
}
_getLocalPath() async {
  String  directoryPath;

  Directory? appDocDirectory;
  if (Platform.isAndroid) {
    appDocDirectory = await getExternalStorageDirectory();
  } else {
    appDocDirectory = await getApplicationDocumentsDirectory();
  }
  var myDir = Directory(appDocDirectory!.path + '/' + 'oro-gold');
  var exist = await myDir.exists();
  if (!exist) {
    var _path = await myDir.create(recursive: true);
    directoryPath = _path.path;
    return directoryPath;
  } else {
    directoryPath = myDir.path;
    return directoryPath;
  }
}
class Tools {


  static Future<bool> hasToDownloadFile(String name, String dir) async {
    var file = File('$dir/$name');
    return await file.exists();
  }
  static getFileName(_path) {
    return _path.split('/').last;
  }
 static Future<File> downloadFile(url) async {
    var directoryPath = await _getLocalPath();
    var filename = await Tools.getFileName(url);
    bool isExists = await Tools.hasToDownloadFile(filename, directoryPath);
    if (isExists) {
      return File('$directoryPath/$filename');
    } else {
      var req = await http.Client().get(Uri.parse(url));
      var file = File('$directoryPath/$filename');
      return file.writeAsBytes(req.bodyBytes);
    }
  }

  static String capitalize(String s) =>
      (s.isEmpty) ? '' : s[0].toUpperCase() + s.substring(1);

  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }static String moneyFormatter(dynamic value) {
    if (value == '' || value == null) return '';
    double money = double.parse(value.toString());
    return NumberFormat.simpleCurrency(
        locale: 'hi', name: 'INR', decimalDigits: 0)
        .format(money);
  }


  // ignore: always_declare_return_types
  static showSnackBar(ScaffoldState scaffoldState, message) {
    // ignore: deprecated_member_use
    scaffoldState.showSnackBar(SnackBar(content: Text(message)));
  }


  /// check tablet screen
  static bool isTablet(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var diagonal =
    sqrt((size.width * size.width) + (size.height * size.height));
    var isTablet = diagonal > 1100.0;
    return isTablet;
  }

  static double? formatDouble(num value) => value * 1.0;


  static Size getDeviceSize(BuildContext context) {
    return MediaQuery
        .of(context)
        .size;
  }static double getDeviceHeight(BuildContext context) {
    return MediaQuery
        .of(context)
        .size.height;
  }static double getDeviceWidth(BuildContext context) {
    return MediaQuery
        .of(context)
        .size.width;
  }

 void  printLog(dynamic data) {
    if (Constants.kLogEnable) {
      final now = DateTime
          .now()
          .toUtc()
          .toString()
          .split(' ')
          .last;
      d.log('[$now]${Constants.kLogTag}${data.toString()}');
    }
  }
}
