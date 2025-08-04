import 'package:flutter/material.dart';

import 'Movie.dart';

class DetailPage extends StatefulWidget {

  Movie? movie;


  DetailPage({required this.movie});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          "${widget.movie!.name}",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("images/${widget.movie!.imageName}"),
            Text(
              "${widget.movie!.price} ₺",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 40,
              ),
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.zero),
                    ),
                  ),
                  onPressed: (){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          duration: Duration(seconds: 3),
                          content: Text("${widget.movie!.name} is rented with ${widget.movie!.price}."),
                          action: SnackBarAction(
                              label: "OK",
                              onPressed: (){
                                Navigator.pop(context);
                              },
                          ),
                      ),
                    );
                  },
                  child: Text(
                      "Rent",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16
                      ),
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
