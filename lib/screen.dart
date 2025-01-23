import 'dart:async';
import 'package:business_project/btmScreens/fav.dart';
import 'package:business_project/btmScreens/profile.dart';
import 'package:business_project/btmScreens/settings.dart';
import 'package:business_project/controllers/UserController.dart';
import 'package:business_project/controllers/favController.dart';
import 'package:business_project/help.dart';
import 'package:business_project/homescreen.dart';
import 'package:business_project/login/login.dart';
import 'package:business_project/controllers/cartController.dart';
import 'package:business_project/products/carts.dart';
import 'package:business_project/controllers/itemsData.dart';
import 'package:business_project/login/databaseService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  final CartsController cartsController = Get.put(CartsController());
  final FavoriteController favoriteController = Get.put(FavoriteController());
  late Timer _timer;
  int _selectedIndex = 0;
  final List<Widget> _screens = [];
  Usercontroller? userData;

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
    // Fetch user data
    fetchUserData();
  }

  void fetchUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DatabaseService dbService = DatabaseService();
      Usercontroller? fetchedUser = await dbService.getUserData(user.uid);
      setState(() {
        userData = fetchedUser;
      });
    }
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
        title: Text(
          'Step & Stride',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
            fontFamily: 'Poppins',
            letterSpacing: 1.5,
            shadows: [
              Shadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 4,
                offset: Offset(2, 2),
              ),
            ],
          ),
        ),
        backgroundColor: Color.fromARGB(255, 211, 196, 219),
        actions: [
          Obx(() {
            return Stack(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Carts()));
                  },
                  icon: Icon(Icons.shopping_cart),
                ),
                if (cartsController.cartItemCount.value > 0)
                  Positioned(
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 12,
                        minHeight: 12,
                      ),
                      child: Text(
                        "${cartsController.cartItemCount.value}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
              ],
            );
          })
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(
                    255, 211, 196, 219), // Soft purple background
                borderRadius: BorderRadius.only(
                  bottomRight:
                      Radius.circular(20), // Rounded bottom-right corner
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 10,
                    offset: Offset(0, 4), // Subtle shadow for depth
                  ),
                ],
              ),
              child: userData == null
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          child: ClipOval(
                            child: Image.asset(
                              'assets/shoeLogo.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                userData!.name,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                userData!.email,
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Settings()))
                    .then((_) {
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Help & Support'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Help())).then((_) {
                  Navigator.pop(context);
                });
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
            ),
          ],
        ),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: FlashyTabBar(
        backgroundColor: Color.fromARGB(255, 211, 196, 219),
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
