class HomeStringModel {
  int? textId;
  String? textTitleEn;
  String? textTitleAr;
  String? textBodyEn;
  String? textBodyAr;
  String? deliveryTime;

  HomeStringModel(
      {this.textId,
        this.textTitleEn,
        this.textTitleAr,
        this.textBodyEn,
        this.textBodyAr,
        this.deliveryTime});

  HomeStringModel.fromJson(Map<String, dynamic> json) {
    textId = json['text_id'];
    textTitleEn = json['text_title_en'];
    textTitleAr = json['text_title_ar'];
    textBodyEn = json['text_body_en'];
    textBodyAr = json['text_body_ar'];
    deliveryTime = json['delivery_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text_id'] = this.textId;
    data['text_title_en'] = this.textTitleEn;
    data['text_title_ar'] = this.textTitleAr;
    data['text_body_en'] = this.textBodyEn;
    data['text_body_ar'] = this.textBodyAr;
    data['delivery_time'] = this.deliveryTime;
    return data;
  }
}