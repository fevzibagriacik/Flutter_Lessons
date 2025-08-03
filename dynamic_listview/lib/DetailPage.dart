import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {

  String countryName = "";

  DetailPage({required this.countryName});

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
        child: Text(
            widget.countryName,
            style: TextStyle(
              fontSize: 30,
            ),
        ),
      ),
    );
  }
}
