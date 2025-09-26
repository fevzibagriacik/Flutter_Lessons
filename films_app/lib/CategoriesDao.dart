import 'package:films_app/Categories.dart';
import 'package:films_app/DatabaseSupport.dart';
import 'package:films_app/Movies.dart';

class CategoriesDao{

  Future<List<Categories>> getAllCategories() async{
    var db = await DatabaseSupport.databaseAccess();

    List<Map<String,dynamic>> maps = await db.rawQuery(
      "SELECT * FROM categories"
    );

    return List.generate(maps.length, (i){
      var row = maps[i];

      return Categories(row["category_id"], row["category_name"]);
    });
  }
}