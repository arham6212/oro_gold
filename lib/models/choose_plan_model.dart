class ChoosePlanModel {
  List<ChoosePlanData>? choosePlanData;

  ChoosePlanModel({this.choosePlanData});

  ChoosePlanModel.fromJson(Map<String, dynamic> json) {
    if (json['choose-plan-data'] != null) {
      choosePlanData = <ChoosePlanData>[];
      json['choose-plan-data'].forEach((v) {
        choosePlanData!.add(ChoosePlanData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (choosePlanData != null) {
      data['choose-plan-data'] =
          choosePlanData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChoosePlanData {
  num? durationInMonths;
  num? totalAmount;
  num? monthlyCharge;
  num? taxCharge;
  num? taxAmount;
  num? totalMaxAmount;

  ChoosePlanData(
      {this.durationInMonths,
      this.totalAmount,
      this.monthlyCharge,
      this.taxCharge,
      this.taxAmount,
      this.totalMaxAmount});

  ChoosePlanData.fromJson(Map<String, dynamic> json) {
    durationInMonths = json['duration-in-months'];
    totalAmount = json['total_amount'];
    monthlyCharge = json['monthly_charge'];
    taxCharge = json['tax_charge'];
    taxAmount = json['tax_amount'];
    totalMaxAmount = json['total-max-amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['duration-in-months'] = durationInMonths;
    data['total_amount'] = totalAmount;
    data['monthly_charge'] = monthlyCharge;
    data['tax_charge'] = taxCharge;
    data['tax_amount'] = taxAmount;
    data['total-max-amount'] = totalMaxAmount;
    return data;
  }
}
