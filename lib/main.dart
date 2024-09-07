import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ShoppingCart(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  int pulloverQuantity = 1;
  int tshirtQuantity = 1;
  int sportDressQuantity = 1;

  final int pulloverPrice = 51;
  final int tshirtPrice = 30;
  final int sportDressPrice = 43;

  int get totalAmount {
    return (pulloverQuantity * pulloverPrice) +
        (tshirtQuantity * tshirtPrice) +
        (sportDressQuantity * sportDressPrice);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Bag"),
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            buildCartItem(
              'Pullover',
              'assets/images/shirts.jpg',
              'Black',
              'L',
              pulloverQuantity,
              pulloverPrice,
                  () {
                setState(() {
                  if (pulloverQuantity > 1) pulloverQuantity--;
                });
              },
                  () {
                setState(() {
                  pulloverQuantity++;
                });
              },
            ),
            buildCartItem(
              'T-Shirt',
              'assets/images/shirts.jpg',
              'Gray',
              'L',
              tshirtQuantity,
              tshirtPrice,
                  () {
                setState(() {
                  if (tshirtQuantity > 1) tshirtQuantity--;
                });
              },
                  () {
                setState(() {
                  tshirtQuantity++;
                });
              },
            ),
            buildCartItem(
              'Sport Dress',
              'assets/images/shirts.jpg',
              'Black',
              'M',
              sportDressQuantity,
              sportDressPrice,
                  () {
                setState(() {
                  if (sportDressQuantity > 1) sportDressQuantity--;
                });
              },
                  () {
                setState(() {
                  sportDressQuantity++;
                });
              },
            ),
            Spacer(),
            Divider(),
            Text(
              "Total amount: \$$totalAmount",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.redAccent,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Congratulations! Your order has been placed!'),
                ));
              },
              child: Text(
                "CHECK OUT",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCartItem(String name, String imagePath, String color, String size,
      int quantity, int price, VoidCallback onDecrease, VoidCallback onIncrease) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: 60,
              width: 60,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text('Color: $color  Size: $size'),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: onDecrease, // Now correctly typed as VoidCallback
                ),
                Text('$quantity'),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: onIncrease, // Now correctly typed as VoidCallback
                ),
              ],
            ),
            SizedBox(width: 10),
            Text("\$$price"),
          ],
        ),
        Divider(),
      ],
    );
  }
}
