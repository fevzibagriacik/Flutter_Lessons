import 'package:flutter/material.dart';
import 'package:movie_app/DetailPage.dart';

import 'Movie.dart';

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
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {


  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  Future<List<Movie>> getMovie() async {
    var movieList = <Movie>[];

    var m1 = Movie(1, "anadoluda.png", "Anadoluda", 15.99);
    var m2 = Movie(1, "django.png", "Django", 15.99);
    var m3 = Movie(1, "inception.png", "Inception", 15.99);
    var m4 = Movie(1, "interstellar.png", "Interstellar", 15.99);
    var m5 = Movie(1, "thehatefuleight.png", "The Hateful Eight", 15.99);
    var m6 = Movie(1, "thepianist.png", "The Pianist", 15.99);

    movieList.add(m1);
    movieList.add(m2);
    movieList.add(m3);
    movieList.add(m4);
    movieList.add(m5);
    movieList.add(m6);

    return movieList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
            "Movies",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
        ),
      ),
      body: FutureBuilder<List<Movie>>(
          future: getMovie(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              var movieList = snapshot.data;

              return GridView.builder(
                  itemCount: movieList!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 3.5,
                  ),
                  itemBuilder: (context, index){
                    var movie = movieList[index];

                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) =>
                                DetailPage(movie: movie,)));
                      },
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                  onTap: (){
                                    Navigator.push(context,
                                    MaterialPageRoute(builder: (context) =>
                                        DetailPage(movie: movie,)));
                                  },
                                  child: Image.asset("images/${movie.imageName}"),
                              ),
                            ),
                            Text(
                                "${movie.name}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                            ),
                            Text(
                                "${movie.price} ₺",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                            ),
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
