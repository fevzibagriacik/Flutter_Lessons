import 'package:lecture_note_app/DatabaseSupport.dart';
import 'package:lecture_note_app/Lessons.dart';
import 'package:sqflite/sqflite.dart';

class LessonsDao{
  Future<List<Lessons>> getAllLessons() async{
    var db = await DatabaseSupport.databaseAccess();

    List<Map<String,dynamic>> maps = await db.rawQuery(
      "SELECT * FROM lessons"
    );

    return List.generate(maps.length, (i){
      var lesson = maps[i];

      return Lessons(lesson["lesson_id"], lesson["lesson_name"], lesson["grade1"], lesson["grade2"]);
    });
  }

  Future<void> addLesson(String lesson_name, int grade1, int grade2) async{
    var db = await DatabaseSupport.databaseAccess();

    await db.insert("lessons",
        {
          "lesson_name" : lesson_name,
          "grade1" : grade1,
          "grade2" : grade2
        });
  }
  
  Future<void> deleteLesson(int lesson_id) async{
    var db = await DatabaseSupport.databaseAccess();
    
    await db.delete("lessons", where: "lesson_id = ?", whereArgs: [lesson_id]);
  }

  Future<void> updateLesson(int lesson_id, String lesson_name, int grade1, int grade2) async{
    var db = await DatabaseSupport.databaseAccess();

    var data = Map<String,dynamic>();
    data["lesson_name"] = lesson_name;
    data["grade1"] = grade1;
    data["grade2"] = grade2;

    await db.update("lessons", data, where: "lesson_id = ?", whereArgs: [lesson_id]);
  }
}