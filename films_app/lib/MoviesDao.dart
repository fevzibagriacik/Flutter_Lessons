import 'package:films_app/Categories.dart';
import 'package:films_app/DatabaseSupport.dart';
import 'package:films_app/Directors.dart';
import 'package:films_app/Movies.dart';

class MoviesDao{

  Future<List<Movies>> getMovies(int category_id) async{
    var db = await DatabaseSupport.databaseAccess();

    List<Map<String,dynamic>> maps = await db.rawQuery(
      "SELECT * FROM movies,categories,directors WHERE movies.category_id = "
          "categories.category_id AND movies.director_id = directors.director_id "
          "AND movies.category_id = $category_id"
    );

    return List.generate(maps.length, (i){
      var row = maps[i];

      var c = Categories(row["category_id"], row["category_name"]);
      var d = Directors(row["director_id"], row["director_name"]);
      var m = Movies(row["movie_id"], row["movie_name"], row["movie_year"],
          row["movie_image"], c, d);

      return m;
    });
  }

}