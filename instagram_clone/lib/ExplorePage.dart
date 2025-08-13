import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {

  var images = ["image-1.jpeg", "image-2.jpeg", "image-3.jpeg", "image-4.jpeg",
                "image-5.jpeg", "image-6.jpg", "image-7.jpg", "image-8.jpeg",
                "image-9.jpeg", "image-10.jpeg", "image-11.jpeg", "image-12.jpg",
                "image-13.jpeg", "image-14.jpeg", "image-15.jpg", "image-16.jpeg",
                "image-17.jpg", "image-18.jpg", "image-19.jpg", "image-20.jpeg",
                "image-21.jpeg", "image-22.jpg", "image-23.jpg", "image-24.jpeg",
                "image-25.jpeg", "image-26.jpeg", "image-27.jpg", "image-28.jpeg",
                "image-29.jpeg", "image-30.jpeg"
                ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: SearchBar(
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
          ),
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1 / 1,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                ),
                itemCount: images.length,
                itemBuilder: (context, index){
                  return Image.asset(""
                      "assets/images/${images[index]}",
                      fit: BoxFit.cover,
                  );
                },
            ),
          ),
        ],
      ),
    );
  }
}
