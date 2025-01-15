// import 'dart:async';
// import 'package:business_project/login/login.dart';
// import 'package:business_project/products/cards.dart';
// import 'package:business_project/products/itemsData.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'custom_bottom_nav.dart'; // Import the custom bottom nav

// void main() {
//   runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Screen()));
// }

// class Screen extends StatefulWidget {
//   const Screen({super.key});

//   @override
//   State<Screen> createState() => _ScreenState();
// }

// class _ScreenState extends State<Screen> {
//   final List<String> images = [
//     'assets/shoe1.png',
//     'assets/shoe2.png',
//     'assets/shoe3.png',
//   ];

//   final PageController _pageController = PageController();
//   late Timer _timer;

//   // Initialize MyState
//   final MyState myState = Get.put(MyState());

//   int _selectedIndex = 0; // Track the selected index for the bottom nav

//   @override
//   void initState() {
//     super.initState();
//     _timer = Timer.periodic(Duration(seconds: 3), (timer) {
//       if (_pageController.page!.round() < images.length - 1) {
//         _pageController.nextPage(
//           duration: Duration(milliseconds: 500),
//           curve: Curves.easeInOut,
//         );
//       } else {
//         _pageController.animateToPage(
//           0,
//           duration: Duration(milliseconds: 500),
//           curve: Curves.easeInOut,
//         );
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _timer.cancel();
//     _pageController.dispose();
//     super.dispose();
//   }

//   // Handle tab selection
//   void _onItemSelected(int index) {
//     setState(() {
//       _selectedIndex = index; // Update the selected index
//     });

//     // Navigate to a new screen based on the selected index
//     switch (index) {
//       case 0:
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => EventsScreen()),
//         );
//         break;
//       case 1:
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => SearchScreen()),
//         );
//         break;
//       case 2:
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => HighlightsScreen()),
//         );
//         break;
//       case 3:
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => SettingsScreen()),
//         );
//         break;
//       case 4:
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => KoreanScreen()),
//         );
//         break;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 211, 196, 219),
//       appBar: AppBar(
//         title: Text("Business App"),
//         backgroundColor: Color.fromARGB(255, 211, 196, 219),
//         actions: [
//           IconButton(onPressed: () {}, icon: Icon(Icons.search)),
//           IconButton(onPressed: () {}, icon: Icon(Icons.settings))
//         ],
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             DrawerHeader(
//                 decoration: BoxDecoration(
//                   color: Color.fromARGB(255, 211, 196, 219),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     CircleAvatar(
//                       backgroundImage: AssetImage('assets/fish.png'),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Text("Panha"),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Text("Hengpanha@gmail.com"),
//                   ],
//                 )),
//             ListTile(
//               leading: Icon(Icons.home),
//               title: Text('Home'),
//               onTap: () {
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.settings),
//               title: Text('Settings'),
//               onTap: () {
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.help),
//               title: Text('Help & Support'),
//               onTap: () {
//                 Navigator.pop(context);
//               },
//             ),
//             Divider(),
//             ListTile(
//               leading: Icon(Icons.logout),
//               title: Text('Logout'),
//               onTap: () {
//                 Navigator.push(
//                     context, MaterialPageRoute(builder: (context) => Login()));
//               },
//             ),
//           ],
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 200,
//               child: PageView.builder(
//                 controller: _pageController,
//                 itemCount: images.length,
//                 itemBuilder: (context, index) {
//                   return Container(
//                     margin: EdgeInsets.all(10),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(16),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.2),
//                           blurRadius: 6,
//                           offset: Offset(0, 3),
//                         ),
//                       ],
//                     ),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(16),
//                       child: Image.asset(
//                         images[index],
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(bottom: 16.0),
//               child: SmoothPageIndicator(
//                 controller: _pageController,
//                 count: images.length,
//                 effect: WormEffect(
//                   dotHeight: 10,
//                   dotWidth: 10,
//                   activeDotColor: Colors.blue,
//                   dotColor: Colors.grey,
//                 ),
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 // Category 1: All
//                 GestureDetector(
//                   onTap: () {
//                     print('All category clicked');
//                   },
//                   child: Column(
//                     children: [
//                       Icon(Icons.all_inclusive, size: 30, color: Colors.blue),
//                       SizedBox(height: 4),
//                       Text('All', style: TextStyle(color: Colors.blue)),
//                     ],
//                   ),
//                 ),
//                 // Category 2: Shoes
//                 GestureDetector(
//                   onTap: () {
//                     print('Shoes category clicked');
//                   },
//                   child: Column(
//                     children: [
//                       Icon(Icons.shopping_cart, size: 30, color: Colors.green),
//                       SizedBox(height: 4),
//                       Text('Shoes', style: TextStyle(color: Colors.green)),
//                     ],
//                   ),
//                 ),
//                 // Category 3: Clothing
//                 GestureDetector(
//                   onTap: () {
//                     print('Clothing category clicked');
//                   },
//                   child: Column(
//                     children: [
//                       Icon(Icons.checkroom, size: 30, color: Colors.orange),
//                       SizedBox(height: 4),
//                       Text('Clothing', style: TextStyle(color: Colors.orange)),
//                     ],
//                   ),
//                 ),
//                 // Category 4: Accessories
//                 GestureDetector(
//                   onTap: () {
//                     print('Accessories category clicked');
//                   },
//                   child: Column(
//                     children: [
//                       Icon(Icons.watch, size: 30, color: Colors.purple),
//                       SizedBox(height: 4),
//                       Text('Accessories', style: TextStyle(color: Colors.purple)),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             Obx(() => GridView.builder(
//                   shrinkWrap: true,
//                   physics: NeverScrollableScrollPhysics(),
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     childAspectRatio: 0.99,
//                   ),
//                   itemCount: myState.products.length,
//                   itemBuilder: (context, index) {
//                     final product = myState.products[index];
//                     return Cards(
//                       name: product['name'] as String,
//                       price: '\$${product['price']}',
//                       iamge: product['image'] as String,
//                     );
//                   },
//                 )),
//           ],
//         ),
//       ),
//       // Add the custom bottom navigation bar
//       bottomNavigationBar: CustomBottomNav(
//         selectedIndex: _selectedIndex,
//         onItemSelected: _onItemSelected,
//       ),
//     );
//   }
// }

// // Example screens (replace with your actual screens)
// class EventsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Events')),
//       body: Center(child: Text('Events Screen')),
//     );
//   }
// }

// class SearchScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Search')),
//       body: Center(child: Text('Search Screen')),
//     );
//   }
// }

// class HighlightsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Highlights')),
//       body: Center(child: Text('Highlights Screen')),
//     );
//   }
// }

// class SettingsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Settings')),
//       body: Center(child: Text('Settings Screen')),
//     );
//   }
// }

// class KoreanScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('한국어')),
//       body: Center(child: Text('한국어 Screen')),
//     );
//   }
// }