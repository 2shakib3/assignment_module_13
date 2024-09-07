import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping Cart',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: ShoppingCart(),
    );
  }
}

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  // Item details
  List<Map<String, dynamic>> items = [
    {"name": "Pullover", "color": "Black", "size": "L", "price": 51, "quantity": 1},
    {"name": "T-Shirt", "color": "Gray", "size": "L", "price": 30, "quantity": 1},
    {"name": "Sport Dress", "color": "Black", "size": "M", "price": 43, "quantity": 1},
  ];

  // Method to calculate the total amount
  int getTotalAmount() {
    int total = 0;
    for (var item in items) {
      total += (item['price'] as int) * (item['quantity'] as int);
    }
    return total;
  }

  // Method to increase the quantity of an item
  void incrementQuantity(int index) {
    setState(() {
      items[index]['quantity']++;
    });
  }

  // Method to decrease the quantity of an item
  void decrementQuantity(int index) {
    setState(() {
      if (items[index]['quantity'] > 1) {
        items[index]['quantity']--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Bag'),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  child: Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          // Placeholder for the image (you can add actual images here)
                          Container(
                            width: 70,
                            height: 70,
                            color: Colors.black12,
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(items[index]['name'], style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                SizedBox(height: 4),
                                Text('Color: ${items[index]['color']}, Size: ${items[index]['size']}',
                                    style: TextStyle(fontSize: 14, color: Colors.grey)),
                                SizedBox(height: 4),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.remove),
                                      onPressed: () => decrementQuantity(index),
                                    ),
                                    Text(items[index]['quantity'].toString(), style: TextStyle(fontSize: 18)),
                                    IconButton(
                                      icon: Icon(Icons.add),
                                      onPressed: () => incrementQuantity(index),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Text('${items[index]['price']} \$', style: TextStyle(fontSize: 18)),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total amount:', style: TextStyle(fontSize: 20)),
                    Text('${getTotalAmount()} \$', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Congratulations! Your order is placed successfully.')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      primary: Colors.red,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Text('CHECK OUT', style: TextStyle(fontSize: 18)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
