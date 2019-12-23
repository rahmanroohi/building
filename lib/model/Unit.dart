import "package:building/SQLiteDbProvider.dart";
class Unit {
  String id;
  String name;
  String unit;

  String TableName="Unit";
  String ScriptTable=
      "CREATE TABLE Unit ("
      "id INTEGER PRIMARY KEY,"
      "name TEXT,"
      "unit TEXT,"
      ")";

  Unit({this.id, this.name, this.unit});

  Unit.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['unit'] = this.unit;
    return data;
  }
  insert(Unit unit) async {
    final db = await SQLiteDbProvider.db.initDB();
    var result = await db.rawInsert(
        "INSERT Into Product (title, date, date, desc)"
            " VALUES (?, ?, ?, ?, ?)",
        [unit.name, unit.unit]
    );
    return result;
  }
  delete(int id) async {
    final db = await SQLiteDbProvider.db.initDB();
    db.delete(TableName, where: "id = ?", whereArgs: [id]);
  }
}