import 'dart:async';
import 'package:business_project/btmScreens/fav.dart';
import 'package:business_project/btmScreens/profile.dart';
import 'package:business_project/homescreen.dart';
import 'package:business_project/login/login.dart';
import 'package:business_project/products/itemsData.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Screen()));
}

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

final MyState myState = Get.put(MyState());

class _ScreenState extends State<Screen> {
  final List<String> images = [
    'assets/shoe1.png',
    'assets/shoe2.png',
    'assets/shoe3.png',
  ];

  final PageController _pageController = PageController();
  late Timer _timer;

  int _selectedIndex = 0; // Define the selected index for the tab bar

  // Define the screens to switch between
  final List<Widget> _screens = [];

  @override
  void initState() {
    super.initState();

    // Initialize the screens with the PageController
    _screens.addAll([
      HomeScreen(pageController: _pageController, images: images),
      Favorite(),
      Profile(),
    ]);

    // Start the timer for auto-swapping images
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_pageController.page!.round() < images.length - 1) {
        _pageController.nextPage(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } else {
        _pageController.animateToPage(
          0,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel(); 
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 211, 196, 219),
      appBar: AppBar(
        title: Text("Business App"),
        backgroundColor: Color.fromARGB(255, 211, 196, 219),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.settings))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 211, 196, 219),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/fish.png'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Panha"),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Hengpanha@gmail.com"),
                  ],
                )),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Help & Support'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
            ),
          ],
        ),
      ),
      body: _screens[_selectedIndex], 
      bottomNavigationBar: FlashyTabBar(
        selectedIndex: _selectedIndex,
        showElevation: true,
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
        }),
        items: [
          FlashyTabBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Favorite'),
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
          ),
        ],
      ),
    );
  }
}
