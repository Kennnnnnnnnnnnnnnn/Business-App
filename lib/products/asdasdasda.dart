import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false, // Remove debug banner
    home: Screen(), // Set the home screen
  ));
}

class Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Card Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ProductCard(
          name: 'Product 1',
          price: '\$19.99',
          imageUrl: 'https://via.placeholder.com/150', // Placeholder image URL
        ),
      ),
    );
  }
}

class ProductCard extends StatefulWidget {
  final String name;
  final String price;
  final String imageUrl;

  const ProductCard({
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5, // Adds shadow to the card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Rounded corners
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.network(
              widget.imageUrl,
              height: 120, // Fixed height for the image
              width: double.infinity, // Full width
              fit: BoxFit.cover, // Cover the entire space
            ),
          ),
          // Product Name
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Product Price
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              widget.price,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }
}