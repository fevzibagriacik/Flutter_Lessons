import 'package:persons_app/DatabaseSupport.dart';
import 'package:persons_app/Persons.dart';

class PersonsDao{

  Future<List<Persons>> getAllPersons() async{
    var db = await DatabaseSupport.databaseAccess();

    List<Map<String,dynamic>> maps = await db.rawQuery(
      "SELECT * FROM persons"
    );

    return List.generate(maps.length, (i){
      var row = maps[i];

      return Persons(row["person_id"], row["person_name"], row["person_number"]);
    });
  }

  Future<List<Persons>> searchPersons(String searchWord) async{
    var db = await DatabaseSupport.databaseAccess();

    List<Map<String,dynamic>> maps = await db.rawQuery(
      "SELECT * FROM persons WHERE person_name LIKE '%$searchWord%'"
    );

    return List.generate(maps.length, (i){
      var row = maps[i];

      return Persons(row["person_id"], row["person_name"], row["person_number"]);
    });
  }
  
  Future<void> addPerson(String person_name, String person_number) async{
    var db = await DatabaseSupport.databaseAccess();
    
    await db.insert(
      "persons", {
        "person_name" : person_name,
        "person_number" : person_number
    });
  }
  
  Future<void> deletePerson(int person_id) async{
    var db = await DatabaseSupport.databaseAccess();
    
    await db.delete("persons", where: "person_id = ?", whereArgs: [person_id]);
  }
  
  Future<void> updatePerson(int person_id, String person_name, String person_number) async{
    var db = await DatabaseSupport.databaseAccess();
    
    var data = Map<String,dynamic>();
    data["person_name"] = person_name;
    data["person_number"] = person_number;
    
    await db.update("persons", data, where: "person_id = ?", whereArgs: [person_id]);
  }

}