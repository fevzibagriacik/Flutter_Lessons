import 'package:flutter/material.dart';
import 'package:lecture_note_app/LessonDetail.dart';
import 'package:lecture_note_app/Lessons.dart';
import 'package:lecture_note_app/LessonsDao.dart';
import 'package:lecture_note_app/NewLesson.dart';

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

  int average = 0;

  Future<List<Lessons>> getAllLessons() async{
    var allLessons = await LessonsDao().getAllLessons();

    return allLessons;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Lecture Note App", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
            FutureBuilder(
                future: getAllLessons(),
                builder: (context, snapshot){
                  if(snapshot.hasData){
                    var allLessons = snapshot.data;

                    double average = 0.0;

                    if(allLessons!.isEmpty){
                    return Text("Average: 0", style: TextStyle(color: Colors.white),);
                  }else{
                      double total = 0.0;

                      for(var l in allLessons){
                        total = total + (l.grade1! + l.grade2!) / 2;
                      }

                      average = total / allLessons.length;
                    }

                    return Text("Average: ${average.toInt()}", style: TextStyle(color: Colors.white),);
                  }else{
                    return Center();
                  }
                },
            ),
          ],
        ),
      ),
      body: FutureBuilder(
          future: getAllLessons(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              var allLessons = snapshot.data;

              return ListView.builder(
                  itemCount: allLessons!.length,
                  itemBuilder: (context, index){
                    var lesson = allLessons[index];

                    return SizedBox(
                      height: 60,
                      child: GestureDetector(
                        onTap: () async{
                          await Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LessonDetail(lesson: lesson,)));
                          setState(() {});
                        },
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(lesson.lesson_name!, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                              Text(lesson.grade1!.toString(), style: TextStyle(fontSize: 16),),
                              Text(lesson.grade2!.toString(), style: TextStyle(fontSize: 16),),
                            ],
                          ),
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
      floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: Colors.blue,
          onPressed: () async{
            await Navigator.push(context,
            MaterialPageRoute(builder: (context) => NewLesson()));

            setState(() {});
          },
          child: Icon(Icons.add, color: Colors.white,),
      ),
    );
  }
}
