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
            image: AssetImage('assets/images/pbackground4.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: PageView.builder(
          controller: _pageController,
          itemCount: 4,
          itemBuilder: (context, index) {
            if (index == 0) {
              return buildPage(context, 'Dessert', [
                {'imagePath': 'assets/images/desert1.jpeg', 'price': '\₱500.00'},
                {'imagePath': 'assets/images/desert2.jpeg', 'price': '\₱200.00'},
                {'imagePath': 'assets/images/desert3.jpeg', 'price': '\₱300.00'},
                {'imagePath': 'assets/images/dessert4.jpg', 'price': '\₱350.00'},
                {'imagePath': 'assets/images/dessert5.jpg', 'price': '\₱250.00'},
              ]);
            } else if (index == 1) {
              return buildPage(context, 'Appetizer', [
                {'imagePath': 'assets/images/appetizer1.jpeg', 'price': '\₱100.00'},
                {'imagePath': 'assets/images/appetizer2.jpeg', 'price': '\₱50.00'},
                {'imagePath': 'assets/images/appetizer3.jpeg', 'price': '\₱100.00'},
                {'imagePath': 'assets/images/appetizer4.jpg', 'price': '\₱150.00'},
                {'imagePath': 'assets/images/appetizer5.jpg', 'price': '\₱100.00'},
              ]);
            } else if (index == 2) {
              return buildPage(context, 'Main Course', [
                {'imagePath': 'assets/images/maincourse1.jpeg', 'price': '\₱100.00'},
                {'imagePath': 'assets/images/maincourse2.jpeg', 'price': '\₱100.00'},
                {'imagePath': 'assets/images/maincourse3.jpg', 'price': '\₱100.00'},
                {'imagePath': 'assets/images/maincourse4.jpeg', 'price': '\₱150.00'},
                {'imagePath': 'assets/images/maincourse5.jpeg', 'price': '\₱100.00'},
              ]);
            } else if (index == 3) {
              return buildPage(context, 'Drinks', [
                {'imagePath': 'assets/images/drinks1.jpeg', 'price': '\₱150.00'},
                {'imagePath': 'assets/images/drinks2.jpeg', 'price': '\₱100.00'},
                {'imagePath': 'assets/images/drinks3.jpeg', 'price': '\₱150.00'},
                {'imagePath': 'assets/images/drinks4.jpg', 'price': '\₱100.00'},
                {'imagePath': 'assets/images/drinks5.jpg', 'price': '\₱100.00'},
              ]);
            }
            return Container(); // Return an empty container for other indexes
          },
        ),
      ),
    );
  }

  Widget buildPage(BuildContext context, String title, List<Map<String, String>> images) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height / 6), // Set the height to 1/4 of the screen height
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white, // Change the background color of the container
              border: Border.all(
                color: Colors.white, // Set the border color
                width: 2.0, // Set the border width
              ),
              borderRadius: BorderRadius.circular(20.0), // Set the border radius
            ),
            child: Column(
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
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8.0,
                      crossAxisSpacing: 8.0,
                    ),
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                images[index]['imagePath']!,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              images[index]['price']!,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
