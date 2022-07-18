import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:oro_gold/models/choose_plan_model.dart';
import 'package:oro_gold/models/locker-contents-model.dart';
import 'package:oro_gold/models/pdf_data_model.dart';

class DataProvider {
  Future<LockerContentsModel> fetchLockerContents() async {
    try {
      var response =
          await getDataFromJson('locker-contents-data');
      Map<String, dynamic> responseMap = jsonDecode(response);
      return LockerContentsModel.fromJson(responseMap);
    } catch (e) {
      throw Exception('Failed to load Data' + e.toString());
    }
  }

  Future<ChoosePlanModel> fetchPlanContents() async {
    try {
      var response =
          await getDataFromJson('choose-plan-data');
      Map<String, dynamic> responseMap = jsonDecode(response);
      return ChoosePlanModel.fromJson(responseMap);
    } catch (e) {
      throw Exception('Failed to load Data' + e.toString());
    }
  }
  Future<PdfDataModel> fetchPdfContents() async {
    try {
      var response =
          await getDataFromJson('pdf-data');
      Map<String, dynamic> responseMap = jsonDecode(response);
      return PdfDataModel.fromJson(responseMap);
    } catch (e) {
      throw Exception('Failed to load Data' + e.toString());
    }
  }


  Future<String> getDataFromJson(String fileName)async{
    var data =
    await rootBundle.loadString('assets/data/$fileName.json');
    return data;
  }
}
