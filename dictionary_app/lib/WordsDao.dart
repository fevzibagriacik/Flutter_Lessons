import 'package:dictionary_app/DatabaseSupport.dart';
import 'package:dictionary_app/Words.dart';

class WordsDao{

  Future<List<Words>> getAllWords() async{
    var db = await DatabaseSupport.databaseAccess();

    List<Map<String,dynamic>> maps = await db.rawQuery(
      "SELECT * FROM words"
    );

    return List.generate(maps.length, (i){
      var row = maps[i];

      return Words(row["word_id"], row["english"], row["turkish"]);
    });
  }

  Future<List<Words>> searchWord(String searchWord) async{
    var db = await DatabaseSupport.databaseAccess();

    List<Map<String,dynamic>> maps = await db.rawQuery(
        "SELECT * FROM words WHERE english LIKE '%$searchWord%'"
    );

    return List.generate(maps.length, (i){
      var row = maps[i];

      return Words(row["word_id"], row["english"], row["turkish"]);
    });
  }
}