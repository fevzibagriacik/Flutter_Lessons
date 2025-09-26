import 'package:films_app/Categories.dart';
import 'package:films_app/CategoriesDao.dart';
import 'package:films_app/MoviesPage.dart';
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
      home: CategoryPage(),
    );
  }
}

class CategoryPage extends StatefulWidget {


  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  Future<List<Categories>> getAllCategories() async{
    var categoryList = CategoriesDao().getAllCategories();

    return categoryList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Categories"),
      ),
      body: FutureBuilder(
          future: getAllCategories(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              var categoryList = snapshot.data;

              return ListView.builder(
                  itemCount: categoryList!.length,
                  itemBuilder: (context, index){
                    var category = categoryList[index];

                    return SizedBox(
                      height: 50,
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => MoviesPage(
                                category: category,
                              )));
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(),
                          child: Center(
                              child: Text(category.category_name!),
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
