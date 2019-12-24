import "package:building/SQLiteDbProvider.dart";
class Cost {
  String id;
  String title;
  String date;
  String desc;

  String TableName="Cost";
   String ScriptTable=
      "CREATE TABLE Cost ("
      "id INTEGER PRIMARY KEY,"
      "title TEXT,"
      "date TEXT"
      ")";
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

  insert(Cost cost) async {
    final db = await SQLiteDbProvider.db.initDB();
    var result = await db.rawInsert(
        "INSERT Into Product (title, date, desc)"
            " VALUES (?, ?, ?, ?)",
        [cost.title, cost.date, cost.desc]
    );
    return result;
  }
  delete(int id) async {
    final db = await SQLiteDbProvider.db.initDB();
    db.delete(TableName, where: "id = ?", whereArgs: [id]);
  }
}