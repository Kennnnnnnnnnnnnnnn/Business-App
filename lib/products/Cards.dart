import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(
//       home: Cards(
//     name: 'Product 1', // Add required properties
//     iamge: 'assets/shoe1.png', // Add required properties
//     price: "19", // Add required properties
//   )));
// }

class Cards extends StatefulWidget {
  // const Cards({super.key});
  final String name;
  final String iamge;
  final String price;
  Cards({
    required this.name,
    required this.iamge,
    required this.price,
  });

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: const Color.fromARGB(255, 220, 196, 194),
      child: Column(
        children: [
          ClipRRect(
            child: Image.asset(
              widget.iamge,
              height: 120,
              width: 120,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              widget.name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
              softWrap: true,
              overflow: TextOverflow.visible,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              widget.price,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
              softWrap: true,
              overflow: TextOverflow.visible,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    // Add functionality for the + button
                    print('Added ${widget.name} to Favorite');
                  },
                  icon: Icon(Icons.favorite, color: Colors.red, size: 30),
                ),
                IconButton(
                  onPressed: () {
                    // Add functionality for the + button
                    print('Added ${widget.name} to cart');
                  },
                  icon: Icon(Icons.add_circle, color: Colors.green, size: 30),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
