import 'package:flag_quiz_app/main.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {

  int? correctNumber;

  ResultScreen({required this.correctNumber});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Result Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("${widget.correctNumber} Correct ${5 - widget.correctNumber!} Incorrect", style: TextStyle(fontSize: 25),),
            Text(
                "% ${((widget.correctNumber! * 100) / 5).toInt()} Success",
                style: TextStyle(
                  color: Colors.pink,
                  fontSize: 25,
                ),
            ),
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
