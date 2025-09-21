import 'package:flag_quiz_app_clone/DatabaseSupport.dart';
import 'package:flag_quiz_app_clone/Flags.dart';

class FlagsDao{
  Future<List<Flags>> getRandomFlags() async{
    var db = await DatabaseSupport.databaseAccess();

    List<Map<String,dynamic>> maps = await db.rawQuery(
        "SELECT * FROM flags ORDER BY RANDOM() LIMIT 15"
    );

    return List.generate(maps.length, (i){
      var row = maps[i];

      return Flags(row["flag_id"], row["flag_name"], row["flag_image"]);
    });
  }

  Future<List<Flags>> getRandomIncorrectFlags(int flag_id) async{
    var db = await DatabaseSupport.databaseAccess();

    List<Map<String,dynamic>> maps = await db.rawQuery(
      "SELECT * FROM flags WHERE flag_id!=$flag_id ORDER BY RANDOM() LIMIT 3"
    );

    return List.generate(maps.length, (i){
      var row = maps[i];

      return Flags(row["flag_id"], row["flag_name"], row["flag_image"]);
    });
  }
}