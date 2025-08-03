import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var formKey = GlobalKey<FormState>();
  var tfUserName = TextEditingController();
  var tfPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: tfUserName,
                      decoration: InputDecoration(
                        hintText: "Username",
                      ),
                      validator: (tfInput){
                        if(tfInput!.isEmpty){
                          return "Enter an username";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: tfPassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Password",
                      ),
                      validator: (tfInput){
                        if(tfInput!.isEmpty){
                          return "Enter a password";
                        }

                        if(tfInput.length < 6){
                          return "Your password least must be 6 letter!";
                        }
                        return null;
                      },
                    ),
                    ElevatedButton(
                        onPressed: (){
                          bool controlResult = formKey.currentState!.validate();

                          if(controlResult == true){
                            String userName = tfUserName.text;
                            String password = tfPassword.text;
                            print("Username: $userName - Password: $password");
                          }
                        },
                        child: Text("Enter"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
