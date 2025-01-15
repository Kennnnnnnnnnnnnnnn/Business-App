import 'package:flutter/material.dart';

final TextEditingController nameController = TextEditingController();
final TextEditingController passController = TextEditingController();
final TextEditingController phoneController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController confirmpassController = TextEditingController();
TextField nameBox() {
  return TextField(
    controller: nameController,
    decoration: InputDecoration(
      labelText: 'Name',
      labelStyle: TextStyle(color: Colors.white),
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
    style: TextStyle(color: Colors.white),
  );
}

TextField phoneBox() {
  return TextField(
    controller: phoneController,
    decoration: InputDecoration(
      prefixIcon: Icon(Icons.phone, color: Colors.white),
      labelText: 'Phone number',
      labelStyle: TextStyle(color: Colors.white),
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
    style: TextStyle(color: Colors.white),
  );
}

TextField passBox() {
  return TextField(
    controller: passController,
    decoration: InputDecoration(
      prefixIcon: Icon(Icons.lock, color: Colors.white),
      labelText: 'Password',
      labelStyle: TextStyle(color: Colors.white),
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
    style: TextStyle(color: Colors.white),
    obscureText: true,
  );
}
TextField confirmpassBox() {
  return TextField(
    controller: confirmpassController,
    decoration: InputDecoration(
      prefixIcon: Icon(Icons.lock, color: Colors.white),
      labelText: 'Password',
      labelStyle: TextStyle(color: Colors.white),
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
    style: TextStyle(color: Colors.white),
    obscureText: true,
  );
}
TextField emailBox() {
  return TextField(
    controller: emailController,
    decoration: InputDecoration(
      prefixIcon: Icon(Icons.email, color: Colors.white),
      labelText: 'Email',
      labelStyle: TextStyle(color: Colors.white),
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
    style: TextStyle(color: Colors.white),
  );
}
