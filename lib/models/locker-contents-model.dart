class LockerContentsModel {
  List<LockerContentsData>? lockerContentsData;

  LockerContentsModel({this.lockerContentsData});

  LockerContentsModel.fromJson(Map<String, dynamic> json) {
    if (json['locker-contents-data'] != null) {
      lockerContentsData = <LockerContentsData>[];
      json['locker-contents-data'].forEach((v) {
        lockerContentsData!.add(LockerContentsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (lockerContentsData != null) {
      data['locker-contents-data'] =
          lockerContentsData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LockerContentsData {
  String? image;
  int? id;
  String? itemName;
  int? qty;
  String? quality;
  String? weight;
  String? grossWeight;
  String? netWeight;

  LockerContentsData(
      {this.image,
        this.id,
        this.itemName,
        this.qty,
        this.quality,
        this.weight,
        this.grossWeight,
        this.netWeight});

  LockerContentsData.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    id = json['id'];
    itemName = json['item-name'];
    qty = json['qty'];
    quality = json['quality'];
    weight = json['weight'];
    grossWeight = json['gross-weight'];
    netWeight = json['net-weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['id'] = id;
    data['item-name'] = itemName;
    data['qty'] = qty;
    data['quality'] = quality;
    data['weight'] = weight;
    data['gross-weight'] = grossWeight;
    data['net-weight'] = netWeight;
    return data;
  }
}
