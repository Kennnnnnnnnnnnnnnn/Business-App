
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'databaseService.dart';

final TextEditingController nameController = TextEditingController();
final TextEditingController passController = TextEditingController();
final TextEditingController phoneController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController confirmpassController = TextEditingController();
final FirebaseAuthService auth = FirebaseAuthService();
Future<User?> signUp() async {
  String userName = nameController.text;
  String email = emailController.text;
  String password = passController.text;
  String phoneNumber = phoneController.text;

  User? user = await auth.signUpWIthEmailAnndPasswd(email, password);
  if (user != null) {
    print("User is successfully created");
    return user;
  } else {
    print("Something is wrong");
    return null;
  }
}

Future<User?> signIp() async {
  String email = emailController.text;
  String password = passController.text;
  User? user = await auth.signInWIthEmailAnndPasswd(email, password);
  if (user != null) {
    print("User is successfully created");
    return user;
  } else {
    print("Something is wrong");
    return null;
  }
}

void dipose() {
  nameController.dispose();
  passController.dispose();
  phoneController.dispose();
  emailController.dispose();
  confirmpassController.dispose();
}

TextField nameBox() {
  return TextField(
    controller: nameController,
    decoration: InputDecoration(
      labelText: 'Name',
      labelStyle: TextStyle(color: Colors.black),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      filled: true,
      fillColor: const Color.fromARGB(255, 169, 96, 141),
    ),
    style: TextStyle(color: Colors.black),
  );
}

TextField phoneBox() {
  return TextField(
    controller: phoneController,
    decoration: InputDecoration(
      prefixIcon: Icon(Icons.phone, color: Colors.black),
      labelText: 'Phone number',
      labelStyle: TextStyle(color: Colors.black),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      filled: true,
      fillColor: const Color.fromARGB(255, 169, 96, 141),
    ),
    style: TextStyle(color: Colors.black),
  );
}

TextField passBox() {
  return TextField(
    controller: passController,
    decoration: InputDecoration(
      prefixIcon: Icon(Icons.lock, color: Colors.black),
      labelText: 'Password',
      labelStyle: TextStyle(color: Colors.black),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      filled: true,
      fillColor: const Color.fromARGB(255, 169, 96, 141),
    ),
    style: TextStyle(color: Colors.black),
    obscureText: true,
  );
}

TextField confirmpassBox() {
  return TextField(
    controller: confirmpassController,
    decoration: InputDecoration(
      prefixIcon: Icon(Icons.lock, color: Colors.black),
      labelText: 'Password',
      labelStyle: TextStyle(color: Colors.black),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      filled: true,
      fillColor: const Color.fromARGB(255, 169, 96, 141),
    ),
    style: TextStyle(color: Colors.black),
    obscureText: true,
  );
}

TextField emailBox() {
  return TextField(
    controller: emailController,
    decoration: InputDecoration(
      prefixIcon: Icon(Icons.email, color: Colors.black),
      labelText: 'Email',
      labelStyle: TextStyle(color: Colors.black),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      filled: true,
      fillColor: const Color.fromARGB(255, 169, 96, 141),
    ),
    style: TextStyle(color: Colors.black),
  );
}
