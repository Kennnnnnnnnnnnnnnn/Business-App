import 'package:business_project/controllers/cartController.dart';
import 'package:business_project/controllers/favController.dart';
import 'package:business_project/login/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseOptions options = FirebaseOptions(
    apiKey: "AIzaSyDD5V_EbOa7D_9R3YWsSTekxJLZSuRMByk",
    appId: "1:610031044962:android:e1e3c64883d6e723f0443b",
    messagingSenderId: "610031044962",
    projectId: "business-app-43f57",
    storageBucket: "business-app-43f57.firebasestorage.app",
  );
  await Firebase.initializeApp(options: options);
  Get.put(PageController());
  Get.put(CartsController());
  Get.put(FavoriteController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
