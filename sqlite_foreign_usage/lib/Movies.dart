import 'package:sqlite_foreign_usage/Categories.dart';
import 'package:sqlite_foreign_usage/Directors.dart';

class Movies{
  int? movie_id;
  String? movie_name;
  int? movie_year;
  String? movie_image;
  Categories? category;
  Directors? director;

  Movies(this.movie_id, this.movie_name, this.movie_year, this.movie_image,
      this.category, this.director);


}