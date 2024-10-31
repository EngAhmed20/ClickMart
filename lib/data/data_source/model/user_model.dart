class userData {
  String? status;
  Data? data;

  userData({this.status, this.data});

  userData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? usesrId;
  String? usersName;
  String? usersEmail;
  String? usersPhone;
  int? usersVerifycode;
  int? usersApprove;
  String? usersCreate;
  String? usersPassword;

  Data(
      {this.usesrId,
        this.usersName,
        this.usersEmail,
        this.usersPhone,
        this.usersVerifycode,
        this.usersApprove,
        this.usersCreate,
        this.usersPassword});

  Data.fromJson(Map<String, dynamic> json) {
    usesrId = json['usesr_id'];
    usersName = json['users_name'];
    usersEmail = json['users_email'];
    usersPhone = json['users_phone'];
    usersVerifycode = json['users_verifycode'];
    usersApprove = json['users_approve'];
    usersCreate = json['users_create'];
    usersPassword = json['users_password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['usesr_id'] = this.usesrId;
    data['users_name'] = this.usersName;
    data['users_email'] = this.usersEmail;
    data['users_phone'] = this.usersPhone;
    data['users_verifycode'] = this.usersVerifycode;
    data['users_approve'] = this.usersApprove;
    data['users_create'] = this.usersCreate;
    data['users_password'] = this.usersPassword;
    return data;
  }
}