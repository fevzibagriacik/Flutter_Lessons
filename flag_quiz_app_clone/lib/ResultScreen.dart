import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {

  int? questionNumber;
  int? correctNumber;
  int? incorrectNumber;


  ResultScreen({required this.questionNumber, required this.correctNumber, required this.incorrectNumber});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Result"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("${widget.correctNumber} Correct ${widget.incorrectNumber} Incorrect", style: TextStyle(fontSize: 30),),
            Text("%${((widget.correctNumber! / widget.questionNumber!) * 100).toInt()} Success", style: TextStyle(fontSize: 30, color: Colors.pink),),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  backgroundColor: Colors.grey[300],
                ),
                child: Text("Reply", style: TextStyle(fontSize: 20),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
