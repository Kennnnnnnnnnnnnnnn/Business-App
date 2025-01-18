import 'package:business_project/products/Cards.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'screen.dart';

class HomeScreen extends StatelessWidget {
  final PageController pageController;

  final List<String> images;

  const HomeScreen({required this.pageController, required this.images});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 200,
            child: PageView.builder(
              controller: pageController,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      images[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: SmoothPageIndicator(
              controller: pageController,
              count: images.length,
              effect: WormEffect(
                dotHeight: 10,
                dotWidth: 10,
                activeDotColor: Colors.blue,
                dotColor: Colors.grey,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  print('All category clicked');
                },
                child: Column(
                  children: [
                    Icon(Icons.all_inclusive, size: 30, color: Colors.blue),
                    SizedBox(height: 4),
                    Text('All', style: TextStyle(color: Colors.blue)),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('Shoes category clicked');
                },
                child: Column(
                  children: [
                    Icon(Icons.shopping_cart, size: 30, color: Colors.green),
                    SizedBox(height: 4),
                    Text('Shoes', style: TextStyle(color: Colors.green)),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('Clothing category clicked');
                },
                child: Column(
                  children: [
                    Icon(Icons.checkroom, size: 30, color: Colors.orange),
                    SizedBox(height: 4),
                    Text('Clothing', style: TextStyle(color: Colors.orange)),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('Accessories category clicked');
                },
                child: Column(
                  children: [
                    Icon(Icons.watch, size: 30, color: Colors.purple),
                    SizedBox(height: 4),
                    Text('Accessories', style: TextStyle(color: Colors.purple)),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Obx(() => GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.9,
                ),
                itemCount: myState.products.length,
                itemBuilder: (context, index) {
                  final product = myState.products[index];
                  return Cards(
                    name: product['name'] as String,
                    price: '\$${product['price']}',
                    iamge: product['image'] as String,
                  );
                },
              )),
        ],
      ),
    );
  }
}
