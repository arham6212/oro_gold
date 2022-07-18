import 'package:oro_gold/models/pdf_data_model.dart';
import 'package:oro_gold/service/data_provider.dart';

import '../models/choose_plan_model.dart';

/// This layer acts as abstraction, it would work irrespective of data source
class RepoProvider {
  final DataProvider _dataProvider = DataProvider();

  fetchLockerContents() async {
    var response = await _dataProvider.fetchLockerContents();
    return response;
  }

  Future<ChoosePlanModel> fetchPlanContents() async {
    var response = await _dataProvider.fetchPlanContents();
    return response;
  }

  Future<PdfDataModel> fetchPdfDataContent() async {
    var response = await _dataProvider.fetchPdfContents();
    return response;
  }
}
