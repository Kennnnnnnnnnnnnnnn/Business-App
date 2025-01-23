import 'package:business_project/controllers/cartController.dart';
import 'package:business_project/controllers/favController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cards extends StatefulWidget {
  final String name;
  final String iamge;
  final num price;

  Cards({
    required this.name,
    required this.iamge,
    required this.price,
  });

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  final CartsController cartsController = Get.put(CartsController());
  final FavoriteController favoriteController = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: const Color.fromARGB(255, 220, 196, 194),
      child: Column(
        mainAxisSize: MainAxisSize.min, 
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              widget.iamge,
              height: 120,
              width: double.infinity, 
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
              maxLines: 2, 
              overflow: TextOverflow.ellipsis,
            ),
          ),
      
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              '\$${widget.price}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
    
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    favoriteController.addItem({
                      'name': widget.name,
                      'image': widget.iamge,
                      'price': widget.price,
                    });
                    print('Added ${widget.name} to favorites');
                  },
                  icon: Icon(Icons.favorite, color: Colors.red, size: 30),
                ),
                IconButton(
                  onPressed: () {
                    cartsController.addItem({
                      'name': widget.name,
                      'image': widget.iamge,
                      'price': widget.price,
                    });
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
