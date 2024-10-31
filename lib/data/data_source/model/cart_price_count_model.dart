
class CartPriceCountModel {
  int? totalprice;
  String? totalcount;

  CartPriceCountModel({this.totalprice, this.totalcount});

  CartPriceCountModel.fromJson(Map<String, dynamic> json) {
    totalprice = json['totalprice'];
    totalcount = json['totalcount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalprice'] = this.totalprice;
    data['totalcount'] = this.totalcount;
    return data;
  }
}