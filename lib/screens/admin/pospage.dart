import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Product {
  String name;
  String imagePath;
  double price;
  String description;

  Product({
    required this.name,
    required this.imagePath,
    required this.price,
    required this.description,
  });
}

class pospage extends StatefulWidget {
  const pospage({Key? key}) : super(key: key);

  @override
  _pospageState createState() => _pospageState();
}

class _pospageState extends State<pospage> {
  List<Product> products = [];

  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  void addProduct() {
    setState(() {
      final newProduct = Product(
        name: nameController.text,
        imagePath: _image?.path ?? '',
        price: double.parse(priceController.text),
        description: descriptionController.text,
      );
      products.add(newProduct);
      // Clear the input fields
      nameController.clear();
      priceController.clear();
      descriptionController.clear();
      _image = null;
    });
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = pickedFile != null ? XFile(pickedFile.path) : null;
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: Key(products[index].name), // Unique key for each item
            onDismissed: (direction) {
              setState(() {
                products.removeAt(index);
              });
            },
            background: Container(
              color: Colors.red,
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 20.0),
            ),
            child: ListTile(
              leading: _image != null
                  ? Image.file(
                File(_image!.path),
                width: 50.0,
                height: 50.0,
              )
                  : null,
              title: Text(products[index].name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Price: \$${products[index].price.toStringAsFixed(2)}'),
                  Text('Description: ${products[index].description}'),
                ],
              ),
              trailing: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Edit Product'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ElevatedButton(
                              onPressed: _pickImage,
                              child: Text('Select Image'),
                            ),
                            TextField(
                              controller: priceController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'Price',
                              ),
                            ),
                            TextField(
                              controller: descriptionController,
                              decoration: InputDecoration(
                                labelText: 'Description',
                              ),
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Cancel'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                products[index].imagePath = _image?.path ?? '';
                                products[index].price =
                                    double.parse(priceController.text);
                                products[index].description =
                                    descriptionController.text;
                                Navigator.of(context).pop();
                              });
                            },
                            child: Text('Update'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Add Product'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      onPressed: _pickImage,
                      child: Text('Select Image'),
                    ),
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: 'Name',
                      ),
                    ),
                    TextField(
                      controller: priceController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Price',
                      ),
                    ),
                    TextField(
                      controller: descriptionController,
                      decoration: InputDecoration(
                        labelText: 'Description',
                      ),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      addProduct();
                      Navigator.of(context).pop();
                    },
                    child: Text('Add'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
