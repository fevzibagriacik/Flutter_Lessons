import 'package:films_app/Movies.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  Movies movie;

  DetailPage({required this.movie});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.movie.movie_name!),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("images/${widget.movie.movie_image}.png"),
            Text(widget.movie.movie_year.toString(), style: TextStyle(fontSize: 24),),
            Text(widget.movie.director?.director_name! ?? "Unknown Director", style: TextStyle(fontSize: 24),),
            Text(widget.movie.category?.category_name! ?? "Unknown Category", style: TextStyle(fontSize: 24),),
          ],
        ),
      ),
    );
  }
}
