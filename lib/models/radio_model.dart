class RadioModel {
  int? id;
  String? name;
  String? url;
  String? recentDate;

  RadioModel({this.id, this.name, this.url, this.recentDate});

  RadioModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
    recentDate = json['recent_date'];
  }
}
