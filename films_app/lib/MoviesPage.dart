import 'package:films_app/Categories.dart';
import 'package:films_app/DetailPage.dart';
import 'package:films_app/Movies.dart';
import 'package:films_app/Categories.dart';
import 'package:films_app/MoviesDao.dart';
import 'package:flutter/material.dart';

class MoviesPage extends StatefulWidget {

  Categories category;

  MoviesPage({required this.category});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {

  Future<List<Movies>> getMovies(int category_id) async{
    var movieList = MoviesDao().getMovies(category_id);

    return movieList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Movies : ${widget.category.category_name}"),
      ),
      body: FutureBuilder(
          future: getMovies(widget.category.category_id!),
          builder: (context, snapshot){
            if(snapshot.hasData){
              var movieList = snapshot.data;

              return GridView.builder(
                  itemCount: movieList!.length,

                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1/2),
                  itemBuilder: (context, index){
                    var movie = movieList[index];

                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder:
                        (context) => DetailPage(movie: movie,)));
                      },
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset("images/${movie.movie_image}.png"),
                            Text(movie.movie_name!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                          ],
                        ),
                      ),
                    );
                  },
              );
            }else{
              return Center();
            }
          },
      ),
    );
  }
}
