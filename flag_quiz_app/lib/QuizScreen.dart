import 'dart:collection';

import 'package:flag_quiz_app/Flags.dart';
import 'package:flag_quiz_app/FlagsDao.dart';
import 'package:flag_quiz_app/ResultScreen.dart';
import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {

  var questions = <Flags>[];
  var incorrectFlags = <Flags>[];
  Flags? correctFlag;
  var allOptions = HashSet<Flags>();

  int questionCounter = 0;
  int correctCounter = 0;
  int incorrectCounter = 0;

  String flagImageName = "placeholder.png";
  String buttonAText = "";
  String buttonBText = "";
  String buttonCText = "";
  String buttonDText = "";

  @override
  void initState() {
    super.initState();

    getQuestion();
    uploadQuestion();
  }

  Future<void> getQuestion() async{
    questions = await FlagsDao().random5Flags();
    uploadQuestion();
  }

  Future<void> uploadQuestion() async{
    correctFlag = questions[questionCounter];

    flagImageName = correctFlag!.flag_image!;

    incorrectFlags = await FlagsDao().random3IncorrectFlags(correctFlag!.flag_id!);

    allOptions.clear();
    allOptions.add(correctFlag!);
    allOptions.add(incorrectFlags[0]);
    allOptions.add(incorrectFlags[1]);
    allOptions.add(incorrectFlags[2]);

    buttonAText = allOptions.elementAt(0).flag_name!;
    buttonBText = allOptions.elementAt(1).flag_name!;
    buttonCText = allOptions.elementAt(2).flag_name!;
    buttonDText = allOptions.elementAt(3).flag_name!;

    setState(() {

    });
  }

  void questionCounterControl(){
    questionCounter++;

    if(questionCounter != 5){
      uploadQuestion();
    }else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ResultScreen(correctNumber: correctCounter,)));
    }
  }

  void correctControl(String buttonText){
    if(correctFlag!.flag_name! == buttonText){
      correctCounter++;
    }else{
      incorrectCounter++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Quiz Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Correct: $correctCounter", style: TextStyle(fontSize: 16),),
                  Text("Incorrect: $incorrectCounter", style: TextStyle(fontSize: 16),)
                ],
              ),
            ),
            questionCounter != 5 ? Text("Question-${questionCounter+1}", style: TextStyle(fontSize: 24),) :
            Text("Question-5", style: TextStyle(fontSize: 24),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/images/$flagImageName"),
            ),
            Padding(
              padding: const EdgeInsets.only(top:16),
              child: SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                    onPressed: (){
                      correctControl(buttonAText);
                      questionCounterControl();
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      backgroundColor: Colors.grey[300],
                    ),
                    child: Text(buttonAText, style: TextStyle(fontSize: 16),),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:16),
              child: SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                  onPressed: (){
                    correctControl(buttonBText);
                    questionCounterControl();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    backgroundColor: Colors.grey[300],
                  ),
                  child: Text(buttonBText, style: TextStyle(fontSize: 16),),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top : 16),
              child: SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                  onPressed: (){
                    correctControl(buttonCText);
                    questionCounterControl();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    backgroundColor: Colors.grey[300],
                  ),
                  child: Text(buttonCText, style: TextStyle(fontSize: 16),),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top:16, bottom: 16),
              child: SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                  onPressed: (){
                    correctControl(buttonDText);
                    questionCounterControl();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    backgroundColor: Colors.grey[300],
                  ),
                  child: Text(buttonDText, style: TextStyle(fontSize: 16),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
