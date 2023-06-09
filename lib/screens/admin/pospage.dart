import 'package:flutter/material.dart';

class pospage extends StatefulWidget {
  @override
  _pospageState createState() => _pospageState();
}

class _pospageState extends State<pospage> {
  final PageController _pageController = PageController(initialPage: 0);
  List<Map<String, String>> cartItems = [];

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
                  'description': 'Black Forest Cake.',
                  'descriptionVisible': 'false',
                },
                {
                  'imagePath': 'assets/images/desert2.jpeg',
                  'price': '\₱200.00',
                  'description': 'Chocolate Ice Cream.',
                  'descriptionVisible': 'false',
                },
                {
                  'imagePath': 'assets/images/desert3.jpeg',
                  'price': '\₱200.00',
                  'description': 'Assorted Donuts.',
                  'descriptionVisible': 'false',
                },
                {
                  'imagePath': 'assets/images/dessert4.jpg',
                  'price': '\₱200.00',
                  'description': 'Assorted Cupcakes.',
                  'descriptionVisible': 'false',
                },
                {
                  'imagePath': 'assets/images/dessert5.jpg',
                  'price': '\₱200.00',
                  'description': 'Apple Pie.',
                  'descriptionVisible': 'false',
                },
                // Add more dessert items with descriptions
              ]);
            } else if (index == 1) {
              return buildPage(context, 'Appetizer', [
                {
                  'imagePath': 'assets/images/appetizer1.jpeg',
                  'price': '\₱100.00',
                  'description': 'Onion Rings.',
                  'descriptionVisible': 'false',
                },
                {
                  'imagePath': 'assets/images/appetizer2.jpeg',
                  'price': '\₱50.00',
                  'description': 'Spring Rolls.',
                  'descriptionVisible': 'false',
                },
                {
                  'imagePath': 'assets/images/appetizer3.jpeg',
                  'price': '\₱50.00',
                  'description': 'Corndog.',
                  'descriptionVisible': 'false',
                },
                {
                  'imagePath': 'assets/images/appetizer4.jpg',
                  'price': '\₱50.00',
                  'description': 'Beef Nachos.',
                  'descriptionVisible': 'false',
                },
                {
                  'imagePath': 'assets/images/appetizer5.jpg',
                  'price': '\₱50.00',
                  'description': 'Takoyaki.',
                  'descriptionVisible': 'false',
                },
                // Add more appetizer items with descriptions
              ]);
            } else if (index == 2) {
              return buildPage(context, 'Main Course', [
                {
                  'imagePath': 'assets/images/maincourse1.jpeg',
                  'price': '\₱100.00',
                  'description': 'Menudo.',
                  'descriptionVisible': 'false',
                },
                {
                  'imagePath': 'assets/images/maincourse2.jpeg',
                  'price': '\₱100.00',
                  'description': 'Sisig.',
                  'descriptionVisible': 'false',
                },
                {
                  'imagePath': 'assets/images/maincourse3.jpg',
                  'price': '\₱100.00',
                  'description': 'Chicken Aftridata.',
                  'descriptionVisible': 'false',
                },
                {
                  'imagePath': 'assets/images/maincourse4.jpg',
                  'price': '\₱100.00',
                  'description': '.',
                  'descriptionVisible': 'false',
                },
                {
                  'imagePath': 'assets/images/maincourse5.jpeg',
                  'price': '\₱100.00',
                  'description': 'Bicol Express.',
                  'descriptionVisible': 'false',
                },
                // Add more main course items with descriptions
              ]);
            } else if (index == 3) {
              return buildPage(context, 'Drinks', [
                {
                  'imagePath': 'assets/images/drinks1.jpeg',
                  'price': '\₱150.00',
                  'description': 'Mocha Frappe.',
                  'descriptionVisible': 'false',
                },
                {
                  'imagePath': 'assets/images/drinks2.jpeg',
                  'price': '\₱100.00',
                  'description': 'Taro Milktea.',
                  'descriptionVisible': 'false',
                },
                {
                  'imagePath': 'assets/images/drinks3.jpeg',
                  'price': '\₱100.00',
                  'description': 'Coffee Iced Latte.',
                  'descriptionVisible': 'false',
                },
                {
                  'imagePath': 'assets/images/drinks4.jpg',
                  'price': '\₱100.00',
                  'description': 'Strawberry Juice.',
                  'descriptionVisible': 'false',
                },
                {
                  'imagePath': 'assets/images/drinks5.jpg',
                  'price': '\₱100.00',
                  'description': 'Pineapple Juice.',
                  'descriptionVisible': 'false',
                },
                // Add more drink items with descriptions
              ]);
            }
            return Container(); // Return an empty container for other indexes
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartPage(cartItems: cartItems),
            ),
          );
        },
        child: Icon(Icons.shopping_cart),
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
                        onTap: () {
                          addToCart(item);
                        },
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

  void addToCart(Map<String, String> item) {
    // Add the item to the cart
    setState(() {
      cartItems.add(item);
    });
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


class CartPage extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;

  CartPage({required this.cartItems});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<int> quantities = [];
  List<bool> isDoubleTapped = [];
  List<bool> isChecked = [];

  @override
  void initState() {
    super.initState();
    quantities = List<int>.filled(widget.cartItems.length, 1, growable: false);
    isDoubleTapped = List<bool>.filled(widget.cartItems.length, false, growable: false);
    isChecked = List<bool>.filled(widget.cartItems.length, false, growable: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: widget.cartItems.length,
        itemBuilder: (context, index) {
          final item = widget.cartItems[index];
          final quantity = quantities[index];
          final price = double.parse(item['price'].substring(1)) * quantity;

          return ListTile(
            leading: Image.asset(
              item['imagePath']!,
              fit: BoxFit.cover,
            ),
            title: Text(price.toStringAsFixed(2)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item['description'].toString()),
                SizedBox(height: 8),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        decreaseQuantity(index);
                      },
                      icon: Icon(Icons.remove_circle),
                    ),
                    GestureDetector(
                      onTap: () {
                        handleQuantityDoubleTap(index);
                      },
                      child: Text(
                        '$quantity',
                        style: TextStyle(
                          color: isDoubleTapped[index] ? Colors.red : Colors.black,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        increaseQuantity(index);
                      },
                      icon: Icon(Icons.add_circle),
                    ),
                  ],
                ),
              ],
            ),
            trailing: Checkbox(
              value: isChecked[index],
              onChanged: (value) {
                toggleCheckBox(index);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: removeCheckedItems,
        child: Icon(Icons.delete),
      ),
    );
  }

  void decreaseQuantity(int index) {
    setState(() {
      if (quantities[index] > 1) {
        quantities[index]--;
      }
    });
  }

  void increaseQuantity(int index) {
    setState(() {
      quantities[index]++;
    });
  }

  void handleQuantityDoubleTap(int index) {
    if (isDoubleTapped[index]) {
      removeItem(index);
    } else {
      setState(() {
        isDoubleTapped[index] = true;
      });

      Future.delayed(Duration(milliseconds: 300), () {
        setState(() {
          isDoubleTapped[index] = false;
        });
      });
    }
  }

  void toggleCheckBox(int index) {
    setState(() {
      isChecked[index] = !isChecked[index];
    });
  }

  void removeItem(int index) {
    setState(() {
      widget.cartItems.removeAt(index);
      quantities.removeAt(index);
      isDoubleTapped.removeAt(index);
      isChecked.removeAt(index);
    });
  }

  void removeCheckedItems() {
    setState(() {
      for (int i = widget.cartItems.length - 1; i >= 0; i--) {
        if (isChecked[i]) {
          widget.cartItems.removeAt(i);
          quantities.removeAt(i);
          isDoubleTapped.removeAt(i);
          isChecked.removeAt(i);
        }
      }
    });
  }
}
