import 'package:flutter/material.dart';
import 'package:food_app/Foods.dart';

class DetailPage extends StatefulWidget {

  Foods? food;

  DetailPage({required this.food});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.food!.foodName}",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("images/${widget.food!.foodImageName}"),
            Text(
              "${widget.food!.foodPrice} ₺",
              style: TextStyle(
                fontSize: 40,
                color: Colors.blue,
              ),
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  onPressed: (){
                    showDialog(
                        context: context,
                        builder: (BuildContext context){
                          return AlertDialog(
                            title: Text("Success Order"),
                            content: Text("Your order is confirmed successfully."),
                            actions: [
                              ElevatedButton(
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                  child: Text("OK"),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                  ),
                              ),
                            ],
                          );
                        },
                    );
                  },
                  child: Text(
                      "Order",
                      style: TextStyle(
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

