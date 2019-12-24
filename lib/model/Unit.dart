import "package:building/SQLiteDbProvider.dart";

class Unit {
  String id;
  String name;
  String unit;

  String TableName = "Unit";
  String ScriptTable = "CREATE TABLE Unit ("
      "id INTEGER PRIMARY KEY,"
      "name TEXT,"
      "unit TEXT"
      ")";

  Unit({this.id, this.name, this.unit});

  Unit.fromPlayer({this.name, this.unit});

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

  Unit.fromMap(dynamic obj) {
    this.name = obj["name"];
    this.unit = obj["unit"];
  }

  Future<int> insert(Unit unit) async {
    final db = await SQLiteDbProvider.db.initDB();
    var result = await db.rawInsert(
        "INSERT Into Unit (name, unit)"
        " VALUES (?, ?)",
        [unit.name, unit.unit]);

    return result;
  }

  delete(int id) async {
    final db = await SQLiteDbProvider.db.initDB();
    db.delete(TableName, where: "id = ?", whereArgs: [id]);
  }

  Future<List<Unit>> getUserModelData(String filter) async {
    var dbClient = await SQLiteDbProvider.db.initDB();
    String sql;
    sql = "SELECT name,unit FROM " + TableName +" where name like '%$filter%'";

    var result = await dbClient.rawQuery(sql);
    if (result.length == 0)
             return null;
    List<Unit> list=new List<Unit>();
    for(int i=0;i<result.length;i++)
      {
        list.add(Unit.fromMap(result[i]));
      }

    return list;
  }
}
