import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                    "_canerarslan",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                ),
                Spacer(),
                IconButton(
                    onPressed: (){

                    },
                    icon: Icon(Icons.add_box_outlined, color: Colors.white, size: 30,),
                ),
                IconButton(
                  onPressed: (){

                  },
                  icon: Icon(Icons.menu, color: Colors.white, size: 30,),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                profileCard("profile-1.jpg"),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Caner Arslan",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text("0", style: TextStyle(color: Colors.white)),
                              Text("gönderi", style: TextStyle(color: Colors.white)),
                            ],
                          ),
                          Column(
                            children: [
                              Text("254", style: TextStyle(color: Colors.white)),
                              Text("takipçi", style: TextStyle(color: Colors.white)),
                            ],
                          ),
                          Column(
                            children: [
                              Text("322", style: TextStyle(color: Colors.white)),
                              Text("takip", style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Text("asdasdsadsadsadasd", style: TextStyle(color: Colors.white),),
            Text("asdasdsadsadsadaasdasdasd", style: TextStyle(color: Colors.white),),
            Text("asdasdsadsadsdasdasdsadsadasdasdasdadasd", style: TextStyle(color: Colors.white),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        onPressed: (){

                        },
                        child: Text("Profili düzenle"),
                    ),
                  ),
                  SizedBox(width: 5,),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      onPressed: (){

                      },
                      child: Text("Profili  paylaş"),
                    ),
                  ),
                  SizedBox(width: 5,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    onPressed: (){

                    },
                    child: Icon(Icons.supervisor_account),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    storyCard("image-1.jpeg", "asdasdas"),
                    storyCard("image-2.jpeg", "asdasdas"),
                    storyCard("image-3.jpeg", "asdasdas"),
                    storyCard("image-4.jpeg", "asdasdas"),
                    storyCard("image-5.jpeg", "asdasdas"),
                    storyCard("image-6.jpg", "asdasdas"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding profileCard(String imageName) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
