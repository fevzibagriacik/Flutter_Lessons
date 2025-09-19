import 'package:flutter/material.dart';
import 'package:sqlite_foreign_usage/Movies.dart';
import 'package:sqlite_foreign_usage/MoviesDao.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<void> show() async{
    var list = await MoviesDao().allMovies();

    for(Movies m in list){
      print("************************");
      print("Movie id: ${m.movie_id}");
      print("Movie name: ${m.movie_name}");
      print("Movie year: ${m.movie_year}");
      print("Movie image: ${m.movie_image}");
      print("Movie category: ${m.category!.category_name}");
      print("Movie director: ${m.director!.director_name}");
    }
  }

  @override
  void initState() {
    super.initState();

    show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

          ],
        ),
      ),
    );
  }
}
