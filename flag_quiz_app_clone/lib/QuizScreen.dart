import 'dart:collection';

import 'package:flag_quiz_app_clone/Flags.dart';
import 'package:flag_quiz_app_clone/FlagsDao.dart';
import 'package:flag_quiz_app_clone/ResultScreen.dart';
import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {

  int questionNumber = 15;
  int questionCounter = 0;
  int correctCounter = 0;
  int incorrectCounter = 0;

  var allFlags = <Flags>[];
  var incorrectFlags = <Flags>[];
  Flags? correctFlag;

  String imageName = "placeholder.png";

  String buttonAText = "";
  String buttonBText = "";
  String buttonCText = "";
  String buttonDText = "";

  var allOptions = HashSet<Flags>();

  Future<void> getQuestion() async{
    allFlags = await FlagsDao().getRandomFlags();
    uploadQuestion();
  }

  Future<void> uploadQuestion() async{
    correctFlag = allFlags[questionCounter];

    imageName = correctFlag!.flag_image!;

    incorrectFlags = await FlagsDao().getRandomIncorrectFlags(correctFlag!.flag_id!);

    allOptions.clear();

    allOptions.add(correctFlag!);
    allOptions.add(incorrectFlags[0]);
    allOptions.add(incorrectFlags[1]);
    allOptions.add(incorrectFlags[2]);

    buttonAText = allOptions.elementAt(0).flag_name!;
    buttonBText = allOptions.elementAt(1).flag_name!;
    buttonCText = allOptions.elementAt(2).flag_name!;
    buttonDText = allOptions.elementAt(3).flag_name!;

    setState(() {});
  }

  void questionControl(String answer){
    questionCounter++;

    if(questionCounter == questionNumber){
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) => ResultScreen(
            questionNumber: questionNumber,
            correctNumber: correctCounter,
            incorrectNumber: incorrectCounter,
          )));
    }

    if(correctFlag!.flag_name! == answer){
      correctCounter++;
    }else{
      incorrectCounter++;
    }
  }

  @override
  void initState() {
    super.initState();

    getQuestion();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Quiz"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Correct: $correctCounter", style: TextStyle(fontSize: 16),),
                Text("Incorrect: $incorrectCounter", style: TextStyle(fontSize: 16),),
              ],
            ),
            Text("Question-${questionCounter+1}", style: TextStyle(fontSize: 16),),
            Image.asset("images/$imageName"),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                onPressed: (){
                  questionControl(buttonAText);
                  getQuestion();
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  backgroundColor: Colors.grey[300],
                ),
                child: Text(buttonAText, style: TextStyle(fontSize: 20),),
              ),
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                onPressed: (){
                  questionControl(buttonBText);
                  getQuestion();
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  backgroundColor: Colors.grey[300],
                ),
                child: Text(buttonBText, style: TextStyle(fontSize: 20),),
              ),
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                onPressed: (){
                  questionControl(buttonCText);
                  getQuestion();
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  backgroundColor: Colors.grey[300],
                ),
                child: Text(buttonCText, style: TextStyle(fontSize: 20),),
              ),
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                onPressed: (){
                  questionControl(buttonDText);
                  getQuestion();
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  backgroundColor: Colors.grey[300],
                ),
                child: Text(buttonDText, style: TextStyle(fontSize: 20),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
