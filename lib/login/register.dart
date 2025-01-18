import 'package:business_project/controllers/UserController.dart';
import 'package:business_project/login/databaseService.dart';
import 'package:business_project/login/login.dart';
import 'package:business_project/login/user_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final dbService = DatabaseService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          color: const Color.fromARGB(255, 211, 196, 219),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Registration",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              nameBox(),
              SizedBox(
                height: 20,
              ),
              emailBox(),
              SizedBox(
                height: 20,
              ),
              passBox(),
              SizedBox(
                height: 20,
              ),
              phoneBox(),
              SizedBox(
                height: 20,
              ),
              // ElevatedButton(
              //     onPressed: () async {
              //       final user = Usercontroller(
              //           name: nameController.text,
              //           phone_num: phoneController.text,
              //           email: emailController.text);
              //       await dbService.create(user);
              //       await signUp();
              //       Navigator.push(context,
              //           MaterialPageRoute(builder: (context) => Login()));
              //     },
              //     style: ElevatedButton.styleFrom(
              //       foregroundColor: Colors.black,
              //       backgroundColor: const Color.fromARGB(255, 169, 96, 141),
              //     ),
              //     child: Text('Complete'))
              ElevatedButton(
                onPressed: () async {
                  User? userAuth = await signUp();
                  if (userAuth != null) {
                    final user = Usercontroller(
                      uid: userAuth.uid, // Pass the user's UID here
                      name: nameController.text,
                      phone_num: phoneController.text,
                      email: emailController.text,
                    );
                    await dbService.create(user);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  } else {
                    print("Sign up failed");
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: const Color.fromARGB(255, 169, 96, 141),
                ),
                child: Text('Complete'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
