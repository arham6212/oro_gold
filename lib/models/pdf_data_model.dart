class PdfDataModel {
  List<PdfData>? pdfData;

  PdfDataModel({this.pdfData});

  PdfDataModel.fromJson(Map<String, dynamic> json) {
    if (json['pdf-data'] != null) {
      pdfData = <PdfData>[];
      json['pdf-data'].forEach((v) {
        pdfData!.add(PdfData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (pdfData != null) {
      data['pdf-data'] = pdfData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PdfData {
  String? language;
  String? url;

  PdfData({this.language, this.url});

  PdfData.fromJson(Map<String, dynamic> json) {
    language = json['language'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['language'] = language;
    data['url'] = url;
    return data;
  }
}
