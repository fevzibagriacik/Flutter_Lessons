import 'package:flag_quiz_app/DatabaseSupport.dart';
import 'package:flag_quiz_app/Flags.dart';

class FlagsDao{

  Future<List<Flags>> random5Flags() async{
    var db = await DatabaseSupport.databaseAccess();

    List<Map<String,dynamic>> maps = await
    db.rawQuery("SELECT * FROM flags ORDER BY RANDOM() LIMIT 5");

    return List.generate(maps.length, (i){
      var row = maps[i];

      return Flags(row["flag_id"], row["flag_name"], row["flag_image"]);
    });
  }

  Future<List<Flags>> random3IncorrectFlags(int flag_id) async{
    var db = await DatabaseSupport.databaseAccess();

    List<Map<String,dynamic>> maps = await
    db.rawQuery("SELECT * FROM flags WHERE flag_id != $flag_id ORDER BY RANDOM() LIMIT 3");

    return List.generate(maps.length, (i){
      var row = maps[i];

      return Flags(row["flag_id"], row["flag_name"], row["flag_image"]);
    });
  }
}