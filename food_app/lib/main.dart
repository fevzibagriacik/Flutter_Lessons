import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app/DetailPage.dart';
import 'package:food_app/Foods.dart';

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
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {


  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  Future<List<Foods>> getFood() async {
    var foodList = <Foods>[];

    var f1 = Foods(1, "Ayran", "ayran.png", 2.0);
    var f2 = Foods(1, "Baklava", "baklava.png", 15.99);
    var f3 = Foods(1, "Fanta", "fanta.png", 3.0);
    var f4 = Foods(1, "Kadayıf", "kadayif.png", 8.50);
    var f5 = Foods(1, "Köfte", "kofte.png", 15.99);
    var f6 = Foods(1, "Makarna", "makarna.png", 14.99);

    foodList.add(f1);
    foodList.add(f2);
    foodList.add(f3);
    foodList.add(f4);
    foodList.add(f5);
    foodList.add(f6);

    return foodList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
            "Foods",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
        ),
      ),
      body: FutureBuilder<List<Foods>>(
          future: getFood(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              var foodList = snapshot.data;
              return ListView.builder(
                  itemBuilder: (context,index){
                    var food = foodList[index];

                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => DetailPage(food: food)));
                      },
                      child: Card(
                        elevation: 5,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                  width: 150,
                                  height: 150,
                                  child: Image.asset("images/${food.foodImageName}"),
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  "${food.foodName}",
                                  style: TextStyle(
                                    fontSize: 24,
                                  ),
                                ),
                                SizedBox(height: 50,),
                                Text(
                                  "${food.foodPrice} ₺",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 24,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            IconButton(
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => DetailPage(food: food)));
                                },
                                icon: Icon(Icons.chevron_right),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: foodList!.length,
              );
            }else{
              return Center();
            }
          },
      ),
    );
  }
}
