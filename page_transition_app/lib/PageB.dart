import 'package:flutter/material.dart';
import 'package:page_transition_app/main.dart';

class PageB extends StatelessWidget {
  const PageB({super.key});

  //old version
  Future<bool> returnButton(BuildContext context) async {
    print("Return is clicked.");
    Navigator.of(context).popUntil((route) => route.isFirst);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Page B"),
        leading: IconButton(
            onPressed: (){
              print("Appbar return button is clicked.");
              //Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
        ),
      ),
      body: PopScope(
        canPop: true,
        onPopInvoked: (canPopState){
          print("Navigation return button is selected in new version.");
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));
                },
                child: Text("Go Main Page"),
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text("Go Previous Page"),
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                child: Text("Return Main Page "),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
