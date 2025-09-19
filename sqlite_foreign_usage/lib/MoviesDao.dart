import 'package:sqlite_foreign_usage/Categories.dart';
import 'package:sqlite_foreign_usage/DatabaseSupport.dart';
import 'package:sqlite_foreign_usage/Movies.dart';
import 'Directors.dart';

class MoviesDao{

  Future<List<Movies>> allMovies() async{
    var db = await DatabaseSupport.databaseAccess();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM movies,categories,directors WHERE movies.category_id=categories.category_id AND movies.director_id=directors.director_id");

    return List.generate(maps.length, (i){

      var row = maps[i];
      var category = Categories(row["category_id"], row["category_name"]);
      var director = Directors(row["director_id"], row["director_Name"]);
      var movie = Movies(row["movie_id"], row["movie_name"], row["movie_year"], row["movie_image"], category, director);

      return movie;
    });
  }

}