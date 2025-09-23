import 'package:flutter/material.dart';
import 'package:lecture_note_app/Lessons.dart';
import 'package:lecture_note_app/LessonsDao.dart';

class LessonDetail extends StatefulWidget {

  Lessons? lesson;


  LessonDetail({required this.lesson});

  @override
  State<LessonDetail> createState() => _LessonDetailState();
}

class _LessonDetailState extends State<LessonDetail> {

  var lessonNameController = TextEditingController();
  var grade1Controller = TextEditingController();
  var grade2Controller = TextEditingController();

  Future<void> deleteLesson(int lesson_id) async{
    await LessonsDao().deleteLesson(lesson_id);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("${lessonNameController.text} is removed.")),
    );

    Navigator.pop(context);
  }

  Future<void> updateLesson(int lesson_id, String lesson_name, int grade1, int grade2) async{
    await LessonsDao().updateLesson(lesson_id, lesson_name, grade1, grade2);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("${lessonNameController.text} is updated.")),
    );
  }

  @override
  void initState() {
    super.initState();

    lessonNameController.text = widget.lesson!.lesson_name!;
    grade1Controller.text = widget.lesson!.grade1.toString();
    grade2Controller.text = widget.lesson!.grade2.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
        title: Text("Lesson Detail", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        actions: [
          GestureDetector(
            onTap: (){
              deleteLesson(widget.lesson!.lesson_id!);
            },
            child: Text("Remove", style: TextStyle(color: Colors.white),),
          ),
          SizedBox(width: 50,),
          GestureDetector(
            onTap: (){
              updateLesson(
                widget.lesson!.lesson_id!,
                lessonNameController.text,
                int.parse(grade1Controller.text),
                int.parse(grade2Controller.text),
              );
            },
            child: Text("Update", style: TextStyle(color: Colors.white),),
          ),
          SizedBox(width: 10,),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Lesson Name",
                ),
                controller: lessonNameController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Grade-1",
                ),
                controller: grade1Controller,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Grade-2",
                ),
                controller: grade2Controller,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
