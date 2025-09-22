import 'package:flutter/material.dart';

import 'Words.dart';

class DetailPage extends StatefulWidget {
  Words word;

  DetailPage({required this.word});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Detail"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(widget.word.english!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40, color: Colors.pink),),
            Text(widget.word.turkish!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),),
          ],
        ),
      ),
    );
  }
}
