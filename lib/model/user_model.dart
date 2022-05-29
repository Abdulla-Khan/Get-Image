class User {
  int? id;
  String? title;
  String? rent;
  String? photo;

  User({this.id, this.title, this.rent, this.photo});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    rent = json['rent'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['rent'] = this.rent;
    data['photo'] = this.photo;
    return data;
  }
}
