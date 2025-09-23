import 'package:flutter/material.dart';
import 'package:lecture_note_app/LessonsDao.dart';

class NewLesson extends StatefulWidget {
  const NewLesson({super.key});

  @override
  State<NewLesson> createState() => _NewLessonState();
}

class _NewLessonState extends State<NewLesson> {

  var lessonNameController = TextEditingController();
  var grade1Controller = TextEditingController();
  var grade2Controller = TextEditingController();

  Future<void> addLesson(String lesson_name, int grade1, int grade2) async{
    await LessonsDao().addLesson(lesson_name, grade1, grade2);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("${lessonNameController.text} is added.")),
    );

    lessonNameController.text = "";
    grade1Controller.text = "";
    grade2Controller.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
        title: Text("New Lesson", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: TextField(
                onChanged: (result){
                  setState(() {
                    lessonNameController.text = result;
                  });
                },
                decoration: InputDecoration(
                  labelText: "Lesson Name",
                ),
                controller: lessonNameController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: TextField(
                onChanged: (result){
                  setState(() {
                    grade1Controller.text = result;
                  });
                },
                decoration: InputDecoration(
                  labelText: "Grade-1",
                ),
                controller: grade1Controller,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: TextField(
                onChanged: (result){
                  setState(() {
                    grade2Controller.text = result;
                  });
                },
                decoration: InputDecoration(
                  labelText: "Grade-2",
                ),
                controller: grade2Controller,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: Colors.blue,
        onPressed: (){
          addLesson(lessonNameController.text, int.parse(grade1Controller.text), int.parse(grade2Controller.text));
        },
        label: Text("Save", style: TextStyle(color: Colors.white, fontSize: 16),),
        icon: Icon(Icons.save, color: Colors.white,),
      ),
    );
  }
}
