import 'package:flutter/material.dart';

class InventoryItem {
  final String name;
  final int quantity;

  InventoryItem({required this.name, required this.quantity});
}

class Inventorypage extends StatefulWidget {
  const Inventorypage({Key? key}) : super(key: key);

  @override
  _InventorypageState createState() => _InventorypageState();
}

class _InventorypageState extends State<Inventorypage> {
  List<InventoryItem> inventoryItems = [
    InventoryItem(name: 'Item 1', quantity: 10),
    InventoryItem(name: 'Item 2', quantity: 5),
    InventoryItem(name: 'Item 3', quantity: 15),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[100],

      body: DataTable(
        columns: const [
          DataColumn(label: Text('Name')),
          DataColumn(label: Text('Quantity')),
        ],
        rows: inventoryItems.map((item) {
          return DataRow(
            cells: [
              DataCell(Text(item.name)),
              DataCell(Text(item.quantity.toString())),
            ],
          );
        }).toList(),
      ),
    );
  }
}
