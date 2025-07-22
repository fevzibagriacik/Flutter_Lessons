import 'package:flutter/material.dart';
import 'package:page_transition_app/PageB.dart';
import 'package:page_transition_app/Persons.dart';

class PageA extends StatefulWidget {
  Persons person;

  PageA({required this.person});

  @override
  State<PageA> createState() => _PageAState();
}

class _PageAState extends State<PageA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Page A"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => PageB()));
              },
              child: Text("Go Page B"),
            ),
            Text("Name: ${widget.person.name}"),
            Text("Age: ${widget.person.age}"),
            Text("Height: ${widget.person.height}"),
            Text("Is Marry: ${widget.person.isMarry}"),
          ],
        ),
      ),
    );
  }
}
