class AddressModel {
  int? addressId;
  int? addressUsersid;
  String? addressCity;
  String? addressStreet;
  double? addressLat;
  double? addressLong;
  String? addressName;

  AddressModel(
      {this.addressId,
        this.addressUsersid,
        this.addressCity,
        this.addressStreet,
        this.addressLat,
        this.addressLong,
        this.addressName});

  AddressModel.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    addressUsersid = json['address_usersid'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
    addressName = json['address_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address_id'] = this.addressId;
    data['address_usersid'] = this.addressUsersid;
    data['address_city'] = this.addressCity;
    data['address_street'] = this.addressStreet;
    data['address_lat'] = this.addressLat;
    data['address_long'] = this.addressLong;
    data['address_name'] = this.addressName;
    return data;
  }
}