import 'package:dictionary_app/DetailPage.dart';
import 'package:dictionary_app/Words.dart';
import 'package:dictionary_app/WordsDao.dart';
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
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {


  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  bool isSearching = false;
  String searchWord = "";

  Future<List<Words>> showAllWords() async{
    var wordList = await WordsDao().getAllWords();

    return wordList;
  }

  Future<List<Words>> search(String searchWord) async{
    var wordList = await WordsDao().searchWord(searchWord);

    return wordList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: isSearching?
        TextField(
          decoration: InputDecoration(
            hintText: "Enter a word",
          ),
          onChanged: (searchResult){
            print("Search result: $searchResult");
            setState(() {
              searchWord = searchResult;
            });
          },
        ) : Text("Dictionary App"),
        actions: [
          isSearching ?
          IconButton(
              onPressed: (){
                setState(() {
                  isSearching = false;
                  searchWord = "";
                });
              },
              icon: Icon(Icons.cancel),
          ) :
          IconButton(
              onPressed: (){
                setState(() {
                  isSearching = true;
                });
              },
              icon: Icon(Icons.search),
          ),
        ],
      ),
      body: FutureBuilder(
          future: isSearching? search(searchWord) : showAllWords(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              var wordList = snapshot.data;

              return ListView.builder(
                itemCount: wordList!.length,
                itemBuilder: (context, index){
                  var word = wordList[index];

                  return SizedBox(
                    height: 50,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(word: word,)));
                      },
                      child: Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(word.english!, style: TextStyle(fontWeight: FontWeight.bold),),
                            Text(word.turkish!),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }else{
              return Center();
            }
          },
      ),
    );
  }
}
