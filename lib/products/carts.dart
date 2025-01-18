import 'package:business_project/controllers/cartController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Carts extends StatefulWidget {
  const Carts({super.key});

  @override
  State<Carts> createState() => _CartsState();
}

class _CartsState extends State<Carts> {
  final CartsController cartsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 211, 196, 219),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 211, 196, 219),
        title: Text('Cart'),
      ),
      body: Obx(() {
        if (cartsController.cartItems.isEmpty) {
          return Center(
            child: Text('Your cart is empty'),
          );
        }
        return ListView.builder(
          itemCount: cartsController.cartItems.length,
          itemBuilder: (context, index) {
            final item = cartsController.cartItems[index];
            return Card(
              color: const Color.fromARGB(255, 220, 196, 194),
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: ListTile(
                leading: Image.asset(
                  item['image'],
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(item['name']),
                subtitle: Text(
                    'Price: \$${item['price']}\nQuantity: ${item['quantity']}'),
                trailing: IconButton(
                  icon: Icon(Icons.remove_circle, color: Colors.red),
                  onPressed: () {
                    if (item['quantity'] > 1) {
                      item['quantity'] -= 1;
                      cartsController.cartItems
                          .refresh(); // Refresh the cart items list
                    } else {
                      cartsController.removeItem(index);
                    }
                  },
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
