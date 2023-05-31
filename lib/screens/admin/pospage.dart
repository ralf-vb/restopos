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
                {
                  'imagePath': 'assets/images/desert1.jpeg',
                  'price': '\₱500.00',
                  'description': 'This is a delicious dessert.',
                  'descriptionVisible': 'false',
                },
                {
                  'imagePath': 'assets/images/desert2.jpeg',
                  'price': '\₱200.00',
                  'description': 'This is another tasty dessert.',
                  'descriptionVisible': 'false',
                },
                {
                  'imagePath': 'assets/images/desert3.jpeg',
                  'price': '\₱200.00',
                  'description': 'This is another tasty dessert.',
                  'descriptionVisible': 'false',
                },
                {
                  'imagePath': 'assets/images/dessert4.jpg',
                  'price': '\₱200.00',
                  'description': 'This is another tasty dessert.',
                  'descriptionVisible': 'false',
                },
                {
                  'imagePath': 'assets/images/dessert5.jpg',
                  'price': '\₱200.00',
                  'description': 'This is another tasty dessert.',
                  'descriptionVisible': 'false',
                },
                // Add more dessert items with descriptions
              ]);
            } else if (index == 1) {
              return buildPage(context, 'Appetizer', [
                {
                  'imagePath': 'assets/images/appetizer1.jpeg',
                  'price': '\₱100.00',
                  'description': 'This is a tasty appetizer.',
                  'descriptionVisible': 'false',
                },
                {
                  'imagePath': 'assets/images/appetizer2.jpeg',
                  'price': '\₱50.00',
                  'description': 'This is another delicious appetizer.',
                  'descriptionVisible': 'false',
                },
                {
                  'imagePath': 'assets/images/appetizer3.jpeg',
                  'price': '\₱50.00',
                  'description': 'This is another delicious appetizer.',
                  'descriptionVisible': 'false',
                },
                {
                  'imagePath': 'assets/images/appetizer4.jpg',
                  'price': '\₱50.00',
                  'description': 'This is another delicious appetizer.',
                  'descriptionVisible': 'false',
                },
                {
                  'imagePath': 'assets/images/appetizer5.jpg',
                  'price': '\₱50.00',
                  'description': 'This is another delicious appetizer.',
                  'descriptionVisible': 'false',
                },
                // Add more appetizer items with descriptions
              ]);
            } else if (index == 2) {
              return buildPage(context, 'Main Course', [
                {
                  'imagePath': 'assets/images/maincourse1.jpeg',
                  'price': '\₱100.00',
                  'description': 'This is a delicious main course.',
                  'descriptionVisible': 'false',
                },
                {
                  'imagePath': 'assets/images/maincourse2.jpeg',
                  'price': '\₱100.00',
                  'description': 'This is another tasty main course.',
                  'descriptionVisible': 'false',
                },
                {
                  'imagePath': 'assets/images/maincourse3.jpg',
                  'price': '\₱100.00',
                  'description': 'This is another tasty main course.',
                  'descriptionVisible': 'false',
                },
                {
                  'imagePath': 'assets/images/maincourse4.jpeg',
                  'price': '\₱100.00',
                  'description': 'This is another tasty main course.',
                  'descriptionVisible': 'false',
                },
                {
                  'imagePath': 'assets/images/maincourse5.jpeg',
                  'price': '\₱100.00',
                  'description': 'This is another tasty main course.',
                  'descriptionVisible': 'false',
                },
                // Add more main course items with descriptions
              ]);
            } else if (index == 3) {
              return buildPage(context, 'Drinks', [
                {
                  'imagePath': 'assets/images/drinks1.jpeg',
                  'price': '\₱150.00',
                  'description': 'This is a refreshing drink.',
                  'descriptionVisible': 'false',
                },
                {
                  'imagePath': 'assets/images/drinks2.jpeg',
                  'price': '\₱100.00',
                  'description': 'This is another refreshing drink.',
                  'descriptionVisible': 'false',
                },
                {
                  'imagePath': 'assets/images/drinks3.jpeg',
                  'price': '\₱100.00',
                  'description': 'This is another refreshing drink.',
                  'descriptionVisible': 'false',
                },
                {
                  'imagePath': 'assets/images/drinks4.jpg',
                  'price': '\₱100.00',
                  'description': 'This is another refreshing drink.',
                  'descriptionVisible': 'false',
                },
                {
                  'imagePath': 'assets/images/drinks5.jpg',
                  'price': '\₱100.00',
                  'description': 'This is another refreshing drink.',
                  'descriptionVisible': 'false',
                },
                // Add more drink items with descriptions
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
        SizedBox(height: MediaQuery.of(context).size.height / 6),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.white,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(20.0),
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
                      final item = images[index];
                      return GestureDetector(
                        onDoubleTap: () {
                          showImageDetails(context, item);
                        },
                        child: Container(
                          margin: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  item['imagePath']!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                item['price']!,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              if (item['descriptionVisible'] == 'true') ...[
                                SizedBox(height: 5),
                                Text(
                                  item['description']!,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ],
                          ),
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

  void showImageDetails(BuildContext context, Map<String, String> item) {
    // Show the details of the item
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Item Details'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                item['imagePath']!,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              Text('Price: ${item['price']}'),
              SizedBox(height: 10),
              Text('Description: ${item['description']}'),
              SizedBox(height: 10),
              // Add more details as desired
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
