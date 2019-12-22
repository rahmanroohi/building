class Cost {
  String id;
  String title;
  String date;
  String desc;

  Cost({this.id, this.title, this.date, this.desc});

  Cost.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    date = json['date'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['date'] = this.date;
    data['desc'] = this.desc;
    return data;
  }
}