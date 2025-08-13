import 'package:flutter/material.dart';
import 'package:instagram_clone/HomePage.dart';
import 'package:instagram_clone/main.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
        title: Text(
            "_canerarslan",
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
            ),
        ),
        actions: [
          IconButton(
              onPressed: (){

              },
              icon: Icon(Icons.send_and_archive),
          ),
        ],
      ),
      body: GestureDetector(
        onHorizontalDragEnd: (details){
          if(details.primaryVelocity! > 0){
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => MainPage()));
          }
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              SearchBar(
                backgroundColor: MaterialStateProperty.all(Color.fromARGB(70, 50, 50, 50)),
                hintText: "Ara",
                leading: Icon(Icons.search),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    storyCard("profile-1.jpg", "Notun"),
                    SizedBox(width: 20, height: 20,),
                    storyCard("profile-2.jpg", "_haticekaplan"),
                    SizedBox(width: 20, height: 20,),
                    storyCard("profile-3.jpeg", "_yagamilight"),
                    SizedBox(width: 20, height: 20,),
                    storyCard("profile-4.jpg", "_hasankurnaz"),
                    SizedBox(width: 20, height: 20,),
                    storyCard("profile-5.jpg", "_osmankayı"),
                    SizedBox(width: 20, height: 20,),
                    storyCard("profile-6.jpg", "_esendurmaz"),
                    SizedBox(width: 20, height: 20,),
                    storyCard("profile-7.jpg", "_hamzabayrak"),
                    SizedBox(width: 20, height: 20,),
                    storyCard("profile-8.jpeg", "_kutaykırmaz"),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(right: 8, left: 8),
                child: Row(
                  children: [
                    Text(
                      "Mesajlar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "İstekler",
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              chatCard("profile-2.jpg", "_haticekaplan", "40d önce aktifti"),
              chatCard("profile-3.jpeg", "_yagamilight", "40d önce aktifti"),
              chatCard("profile-4.jpg", "_hasankurnaz", "40d önce aktifti"),
              chatCard("profile-5.jpg", "_osmankayı", "40d önce aktifti"),
              chatCard("profile-6.jpg", "_esendurmaz", "40d önce aktifti"),
              chatCard("profile-7.jpg", "_hamzabayrak", "40d önce aktifti"),
              chatCard("profile-8.jpeg", "_kutaykırmaz", "40d önce aktifti"),
            ],
          ),
        ),
      ),
    );
  }

  Padding chatCard(String imageName, String profileName, String activity) {
    return Padding(
          padding: const EdgeInsets.only(right: 8, left: 8, top: 8),
          child: SizedBox(
            width: double.infinity,
            height: 75,
            child: Card(
              color: Colors.black,
              child: Row(
                children: [
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: Card(
                      clipBehavior: Clip.antiAlias, //trim corners
                      shape: CircleBorder(),
                      child: Stack(
                        children: [
                          Positioned.fill( //image in card
                            child: Image.asset(
                              "assets/images/$imageName",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16, left: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            profileName,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                        ),
                        Text(
                          activity,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: (){

                      },
                      icon: Icon(Icons.camera_alt_outlined, size: 30,),
                  ),
                ],
              ),
            ),
          ),
        );
  }

  Column storyCard(String imageName, String imageText) {
    return Column(
      children: [
        SizedBox(
          width: 75,
          height: 75,
          child: Card(
            clipBehavior: Clip.antiAlias, //trim corners
            shape: CircleBorder(),
            child: Stack(
              children: [
                Positioned.fill( //image in card
                  child: Image.asset(
                    "assets/images/$imageName",
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),
        Text(
          imageText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
