// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Order Confirmation',
//       theme: ThemeData(
//         primarySwatch: Colors.deepPurple,
//       ),
//       home: OrderPage(
//         orderedItems: [
//           {
//             'name': 'Wireless Headphones',
//             'price': 99.99,
//             'quantity': 2,
//             'image': 'assets/product1.png', // Replace with your image path
//           },
//           {
//             'name': 'Smart Watch',
//             'price': 149.99,
//             'quantity': 1,
//             'image': 'assets/product2.png', // Replace with your image path
//           },
//           {
//             'name': 'Bluetooth Speaker',
//             'price': 59.99,
//             'quantity': 3,
//             'image': 'assets/product3.png', // Replace with your image path
//           },
//         ],
//         totalPrice: 99.99 * 2 + 149.99 * 1 + 59.99 * 3, // Fixed total price
//       ),
//     );
//   }
// }

// class OrderPage extends StatelessWidget {
//   final List<Map<String, dynamic>> orderedItems;
//   final double totalPrice;

//   OrderPage({required this.orderedItems, required this.totalPrice});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 211, 196, 219),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: 10),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: orderedItems.length,
//                 itemBuilder: (context, index) {
//                   final item = orderedItems[index];
//                   return Card(
//                     color: const Color.fromARGB(255, 220, 196, 194),
//                     margin: EdgeInsets.symmetric(vertical: 8),
//                     child: Padding(
//                       padding: const EdgeInsets.all(12.0),
//                       child: Row(
//                         children: [
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(10),
//                             child: Image.asset(
//                               item['image'],
//                               width: 60,
//                               height: 60,
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
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                     color: Color.fromARGB(255, 169, 96, 141),
//                                   ),
//                                 ),
//                                 SizedBox(height: 4),
//                                 Text(
//                                   'Quantity: ${item['quantity']}',
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     color: Colors.deepPurple.shade400,
//                                   ),
//                                 ),
//                                 SizedBox(height: 4),
//                                 Text(
//                                   'Price: \$${(item['price'] * item['quantity']).toStringAsFixed(2)}',
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     color: Colors.deepPurple.shade400,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             SizedBox(height: 20),
//             Divider(color: Colors.deepPurple.shade400),
//             SizedBox(height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Total:',
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Color.fromARGB(255, 169, 96, 141),
//                   ),
//                 ),
//                 Text(
//                   '\$${totalPrice.toStringAsFixed(2)}',
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.deepPurple.shade400,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 20),
//             Center(
//               child: ElevatedButton(
//                 onPressed: () {
//                   showDialog(
//                     context: context,
//                     builder: (context) {
//                       return AlertDialog(
//                         backgroundColor: Color.fromARGB(255, 211, 196, 219),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                         content: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Text(
//                               'Select Payment Method',
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                                 color: Color.fromARGB(255, 169, 96, 141),
//                               ),
//                             ),
//                             SizedBox(height: 20),
//                             ListTile(
//                               leading: Icon(Icons.qr_code,
//                                   color: Color.fromARGB(255, 44, 38, 54)),
//                               title: Text('Qr code'),
//                               onTap: () {
//                                 Navigator.pop(context);
//                                 _showSuccessDialog(context);
//                               },
//                             ),
//                             ListTile(
//                               leading: Icon(Icons.account_balance_wallet,
//                                   color: Color.fromARGB(255, 44, 38, 54)),
//                               title: Text('Wallet'),
//                               onTap: () {
//                                 Navigator.pop(context);
//                                 _showSuccessDialog(context);
//                               },
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Color.fromARGB(255, 169, 96, 141),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(25),
//                   ),
//                   padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
//                   shadowColor: Colors.deepPurple.shade200,
//                   elevation: 8,
//                 ),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Icon(Icons.payment, color: Colors.white),
//                     SizedBox(width: 10),
//                     Text(
//                       'Proceed to Pay',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// void _showSuccessDialog(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (context) {
//       return AlertDialog(
//         backgroundColor: Color.fromARGB(255, 211, 196, 219),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(15),
//         ),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Icon(
//               Icons.check_circle,
//               color: Colors.green,
//               size: 60,
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Payment Successful!',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: Color.fromARGB(255, 169, 96, 141),
//               ),
//             ),
//             SizedBox(height: 10),
//             Text(
//               'Thank you for your purchase.',
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.grey.shade600,
//               ),
//             ),
//           ],
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: Text(
//               'Continue Shopping',
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.deepPurple.shade400,
//               ),
//             ),
//           ),
//         ],
//       );
//     },
//   );
// }
