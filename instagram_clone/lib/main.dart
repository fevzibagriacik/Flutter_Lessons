import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:instagram_clone/CreatingPostPage.dart';
import 'package:instagram_clone/ExplorePage.dart';
import 'package:instagram_clone/HomePage.dart';
import 'package:instagram_clone/ProfilePage.dart';
import 'package:instagram_clone/ReelsPage.dart';

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

  var pageList = [HomePage(), ExplorePage(), CreatingPostPage(), ReelsPage(), ProfilePage()];
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[currentPageIndex],
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
              backgroundColor: Colors.black,
              type: BottomNavigationBarType.fixed, //remove default settings
              currentIndex: currentPageIndex,
              onTap: (index){
                setState(() {
                  currentPageIndex = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_filled, color: Colors.white, size: 30,),
                    label: "",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search, color: Colors.white, size: 30,),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.add_box_outlined, color: Colors.white, size: 30,),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.video_library_outlined, color: Colors.white, size: 30,),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_outlined, color: Colors.white, size: 30,),
                  label: "",
                ),
              ],
          ),
        ),
    );
  }
}
