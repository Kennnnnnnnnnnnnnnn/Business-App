// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'Cart Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.deepPurple,
//       ),
//       home: Carts(),
//     );
//   }
// }

// class CartsController extends GetxController {
//   var cartItems = [].obs;

//   void removeItem(int index) {
//     cartItems.removeAt(index);
//   }
// }

// class Carts extends StatefulWidget {
//   const Carts({super.key});

//   @override
//   State<Carts> createState() => _CartsState();
// }

// class _CartsState extends State<Carts> {
//   final CartsController cartsController = Get.put(CartsController());

//   @override
//   void initState() {
//     super.initState();
//     // Add sample items to the cart for testing
//     cartsController.cartItems.addAll([
//       {
//         'name': 'Wireless Headphones',
//         'price': 99.99,
//         'quantity': 1,
//         'image': 'assets/product1.png', // Replace with your image path
//       },
//       {
//         'name': 'Smart Watch',
//         'price': 149.99,
//         'quantity': 1,
//         'image': 'assets/product2.png', // Replace with your image path
//       },
//       {
//         'name': 'Bluetooth Speaker',
//         'price': 59.99,
//         'quantity': 1,
//         'image': 'assets/product3.png', // Replace with your image path
//       },
//     ]);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 211, 196, 219),
//       body: Obx(() {
//         if (cartsController.cartItems.isEmpty) {
//           return Center(
//             child: Text(
//               'Your cart is empty',
//               style: TextStyle(
//                 fontSize: 18,
//                 color: Colors.deepPurple.shade700,
//               ),
//             ),
//           );
//         }

//         // Calculate total price
//         double totalPrice = cartsController.cartItems.fold(0, (sum, item) {
//           return sum + (item['price'] * item['quantity']);
//         });

//         return Column(
//           children: [
//             Expanded(
//               child: ListView.builder(
//                 itemCount: cartsController.cartItems.length,
//                 itemBuilder: (context, index) {
//                   final item = cartsController.cartItems[index];
//                   return Card(
//                     color: const Color.fromARGB(255, 220, 196, 194),
//                     margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//                     child: Padding(
//                       padding: const EdgeInsets.all(12.0),
//                       child: Row(
//                         children: [
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(10),
//                             child: Image.asset(
//                               item['image'],
//                               width: 80,
//                               height: 80,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           SizedBox(width: 16),
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   item['name'],
//                                   style: TextStyle(
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.deepPurple.shade700,
//                                   ),
//                                 ),
//                                 SizedBox(height: 8),
//                                 Text(
//                                   '\$${item['price'].toStringAsFixed(2)}',
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     color: Colors.deepPurple.shade400,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Row(
//                             children: [
//                               IconButton(
//                                 icon: Icon(Icons.remove_circle,
//                                     color: Colors.red),
//                                 onPressed: () {
//                                   if (item['quantity'] > 1) {
//                                     item['quantity'] -= 1;
//                                     cartsController.cartItems.refresh();
//                                   } else {
//                                     cartsController.removeItem(index);
//                                   }
//                                 },
//                               ),
//                               Text(
//                                 '${item['quantity']}',
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.deepPurple.shade700,
//                                 ),
//                               ),
//                               IconButton(
//                                 icon:
//                                     Icon(Icons.add_circle, color: Colors.green),
//                                 onPressed: () {
//                                   item['quantity'] += 1;
//                                   cartsController.cartItems.refresh();
//                                 },
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             // Bottom bar with Total and Place Order button
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//               decoration: BoxDecoration(
//                 color: const Color.fromARGB(255, 220, 196, 194),
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(20),
//                   topRight: Radius.circular(20),
//                 ),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black12,
//                     blurRadius: 10,
//                     offset: Offset(0, -5),
//                   ),
//                 ],
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Total: \$${totalPrice.toStringAsFixed(2)}',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.deepPurple.shade700,
//                     ),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       // Add your place order logic here
//                       print('Place Order Button Pressed');
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.deepPurple.shade400,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(15),
//                       ),
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//                     ),
//                     child: Text(
//                       'Place Order',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         );
//       }),
//     );
//   }
// }
