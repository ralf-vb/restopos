import 'package:flutter/material.dart';

class pospage extends StatelessWidget {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/pbackground2.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: PageView.builder(
          controller: _pageController,
          itemCount: 5,
          itemBuilder: (context, index) {
            if (index == 0) {
              return buildPage('Dessert', [
                'assets/images/desert1.jpeg',
                'assets/images/desert2.jpeg',
                'assets/images/desert3.jpeg',
                'assets/images/dessert4.jpg',
                'assets/images/dessert5.jpg',
              ]);
            } else if (index == 1) {
              return buildPage('Appetizer', [
                'assets/images/appetizer1.jpeg',
                'assets/images/appetizer2.jpeg',
                'assets/images/appetizer3.jpeg',
                'assets/images/appetizer4.jpg',
                'assets/images/appetizer5.jpg',
              ]);
            } else if (index == 2) {
              return buildPage('Main Course', [
                'assets/images/maincourse1.jpeg',
                'assets/images/maincourse2.jpeg',
                'assets/images/maincourse3.jpg',
                'assets/images/maincourse4.jpeg',
                'assets/images/maincourse5.jpeg',
              ]);
            } else if (index == 3) {
              return buildPage('Drinks', [
                'assets/images/drinks1.jpeg',
                'assets/images/drinks2.jpeg',
                'assets/images/drinks3.jpeg',
                'assets/images/drinks4.jpg',
                'assets/images/drinks5.jpg',
              ]);
            }
          },
        ),
      ),
    );
  }

  Widget buildPage(String title, List<String> imagePaths) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: imagePaths.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(8.0),
                child: Image.asset(
                  imagePaths[index],
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
