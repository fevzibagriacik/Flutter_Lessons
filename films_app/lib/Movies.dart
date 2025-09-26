import 'package:films_app/Categories.dart';
import 'package:films_app/Directors.dart';

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