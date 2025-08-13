import 'package:flutter/material.dart';
import 'package:instagram_clone/ChatPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onHorizontalDragEnd: (details){
          if(details.primaryVelocity! < 0){ //if we want to right, we use '>'
            Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage()));
          }
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "Instagram",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: "Billabong",
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: (){

                      },
                      icon: Icon(
                        Icons.favorite_outline_sharp,
                        size: 35,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => ChatPage()));
                      },
                      icon: Icon(
                        Icons.chat,
                        size: 35,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    storyCard("profile-1.jpg", "Hikayen"),
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
              postCard("profile-1.jpg", "_canerarslan", "image-1.jpeg", 2500,
                  400, 50, 35, "dasdasfsflpaksfşsaflsaiflisaflsaipflasipflsafp"
                      "fsapkfopşsakfasşpfkasoflksaşfolksaşfaskfşaskfasşfkasşf"
                      "safkaspşokfaspşfkasşfoksafğasflpsaflsüaflsapfklsfüalf"
                      "aspfkasğfplasdğşasğflpğsafdlüsafklpaoskfdasüfğplfğüsaşf"
                      "aspfkasğpfkasğpfklsaflfüğsaüğ"),
              SizedBox(height: 20,),
              postCard("profile-2.jpg", "_haticekaplan", "image-2.jpeg", 58,
                  11, 3, 2, "dasdasfsflpaksfşsaflsaiflisaflsaipflasipflsafp"
                      "fsapkfopşsakfasşpfkasoflksaşfolksaşfaskfşaskfasşfkasşf"
                      "safkaspşokfaspşfkasşfoksafğasflpsaflsüaflsapfklsfüalf"
                      "aspfkasğfplasdğşasğflpğsafdlüsafklpaoskfdasüfğplfğüsaşf"
                      "aspfkasğpfkasğpfklsaflfüğsaüğ"),
              SizedBox(height: 20,),
              postCard("profile-3.jpeg", "_yagamilight", "image-3.jpeg", 8000,
                  1000, 100, 67, "dasdasfsflpaksfşsaflsaiflisaflsaipflasipflsafp"
                      "fsapkfopşsakfasşpfkasoflksaşfolksaşfaskfşaskfasşfkasşf"
                      "safkaspşokfaspşfkasşfoksafğasflpsaflsüaflsapfklsfüalf"
                      "aspfkasğfplasdğşasğflpğsafdlüsafklpaoskfdasüfğplfğüsaşf"
                      "aspfkasğpfkasğpfklsaflfüğsaüğ"),
              SizedBox(height: 20,),
              postCard("profile-4.jpg", "_hasankurnaz", "image-4.jpeg", 500,
                  230, 20, 5, "dasdasfsflpaksfşsaflsaiflisaflsaipflasipflsafp"
                      "fsapkfopşsakfasşpfkasoflksaşfolksaşfaskfşaskfasşfkasşf"
                      "safkaspşokfaspşfkasşfoksafğasflpsaflsüaflsapfklsfüalf"
                      "aspfkasğfplasdğşasğflpğsafdlüsafklpaoskfdasüfğplfğüsaşf"
                      "aspfkasğpfkasğpfklsaflfüğsaüğ"),
              SizedBox(height: 20,),
              postCard("profile-5.jpg", "_osmankayı", "image-5.jpeg", 450,
                  23, 5, 2, "dasdasfsflpaksfşsaflsaiflisaflsaipflasipflsafp"
                      "fsapkfopşsakfasşpfkasoflksaşfolksaşfaskfşaskfasşfkasşf"
                      "safkaspşokfaspşfkasşfoksafğasflpsaflsüaflsapfklsfüalf"
                      "aspfkasğfplasdğşasğflpğsafdlüsafklpaoskfdasüfğplfğüsaşf"
                      "aspfkasğpfkasğpfklsaflfüğsaüğ"),
              SizedBox(height: 20,),
              postCard("profile-6.jpg", "_esendurmaz", "image-6.jpg", 220,
                  177, 21, 4, "dasdasfsflpaksfşsaflsaiflisaflsaipflasipflsafp"
                      "fsapkfopşsakfasşpfkasoflksaşfolksaşfaskfşaskfasşfkasşf"
                      "safkaspşokfaspşfkasşfoksafğasflpsaflsüaflsapfklsfüalf"
                      "aspfkasğfplasdğşasğflpğsafdlüsafklpaoskfdasüfğplfğüsaşf"
                      "aspfkasğpfkasğpfklsaflfüğsaüğ"),
              SizedBox(height: 20,),
              postCard("profile-7.jpg", "_canerarslan", "image-7.jpg", 10,
                  1, 2, 3, "dasdasfsflpaksfşsaflsaiflisaflsaipflasipflsafp"
                      "fsapkfopşsakfasşpfkasoflksaşfolksaşfaskfşaskfasşfkasşf"
                      "safkaspşokfaspşfkasşfoksafğasflpsaflsüaflsapfklsfüalf"
                      "aspfkasğfplasdğşasğflpğsafdlüsafklpaoskfdasüfğplfğüsaşf"
                      "aspfkasğpfkasğpfklsaflfüğsaüğ"),
              SizedBox(height: 20,),
              postCard("profile-8.jpeg", "_hamzabayrak", "image-8.jpeg", 451,
                  32, 16, 7, "dasdasfsflpaksfşsaflsaiflisaflsaipflasipflsafp"
                      "fsapkfopşsakfasşpfkasoflksaşfolksaşfaskfşaskfasşfkasşf"
                      "safkaspşokfaspşfkasşfoksafğasflpsaflsüaflsapfklsfüalf"
                      "aspfkasğfplasdğşasğflpğsafdlüsafklpaoskfdasüfğplfğüsaşf"
                      "aspfkasğpfkasğpfklsaflfüğsaüğ"),
            ],
          ),
        ),
      ),
    );
  }

  Card postCard(String profileImage, String profileName, String postImage,
      int like, int comment, int repeatShare, int share, String description) {
    return Card(
      color: Colors.black,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 50,
                height: 50,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: CircleBorder(),
                  child: Stack(
                    children: [
                      Positioned.fill( //image in card
                        child: Image.asset(
                          "assets/images/$profileImage",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 5,),
              Text(
                profileName,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Image.asset(
            "assets/images/$postImage",
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Row(
            children: [
              SizedBox(width: 10,),
              IconButton(
                onPressed: (){
                  print("Like");
                },
                icon: Icon(Icons.favorite_outline_sharp, color: Colors.white,),
              ),
              Text("$like", style: TextStyle(color: Colors.white),),
              SizedBox(width: 10,),
              IconButton(
                onPressed: (){
                  print("Comment");
                },
                icon: Icon(Icons.comment, color: Colors.white,),
              ),
              Text("$comment", style: TextStyle(color: Colors.white),),
              SizedBox(width: 10,),
              IconButton(
                onPressed: (){
                  print("Repeat share");
                },
                icon: Icon(Icons.repeat, color: Colors.white,),
              ),
              Text("$repeatShare", style: TextStyle(color: Colors.white),),
              SizedBox(width: 10,),
              IconButton(
                onPressed: (){
                  print("Share");
                },
                icon: Icon(Icons.send, color: Colors.white,),
              ),
              Text("$share", style: TextStyle(color: Colors.white),),
              Spacer(),
              IconButton(
                onPressed: (){
                  print("Save");
                },
                icon: Icon(Icons.save_outlined, color: Colors.white,),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 8),
            child: Text(
              description,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column storyCard(String imageName, String imageText) {
    return Column(
      children: [
        SizedBox(
          width: 90,
          height: 90,
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
