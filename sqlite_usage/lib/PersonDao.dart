import 'package:sqlite_usage/DatabaseSupport.dart';
import 'package:sqlite_usage/Persons.dart';

class PersonDao{

  Future<List<Persons>> allPersons() async {
    var db = await DatabaseSupport.databaseAccess();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM persons");

    return List.generate(maps.length, (i) {

      var row = maps[i];
      return Persons(row["person_id"], row["person_name"], row["person_age"]);

    });
  }

  Future<void> addPerson(String person_name, int person_age) async {
    var db = await DatabaseSupport.databaseAccess();

    var data = Map<String,dynamic>();
    data["person_name"] = person_name;
    data["person_age"] = person_age;

    await db.insert("persons", data);
  }

  Future<void> deletePerson(int person_id) async {
    var db = await DatabaseSupport.databaseAccess();

    await db.delete("persons", where: "person_id = ?", whereArgs: [person_id]);
  }

  Future<void> updatePerson(int person_id, String person_name, int person_age) async {
    var db = await DatabaseSupport.databaseAccess();

    var data = Map<String,dynamic>();
    data["person_name"] = person_name;
    data["person_age"] = person_age;

    await db.update("persons", data, where: "person_id = ?", whereArgs: [person_id]);
  }

}