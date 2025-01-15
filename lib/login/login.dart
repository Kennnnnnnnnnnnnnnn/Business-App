import 'package:business_project/login/register.dart';
import 'package:business_project/login/user_info.dart';
import 'package:business_project/reuseable_classes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// import 'package:flutter/services.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Login(),
  ));
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => Login_State();
}

class Login_State extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                const Color.fromARGB(255, 127, 18, 236),
                const Color.fromARGB(255, 184, 33, 70)
              ]),
            ),
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Logo('image'),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Heng Panha',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
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
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color.fromARGB(255, 169, 96, 141),
                    ),
                    child: Text('Login')),
                SizedBox(height: 20),
                RichText(
                    text: TextSpan(text: "Don't have an accont?", children: [
                  TextSpan(
                    text: ' Register here',
                    style:
                        TextStyle(color: const Color.fromARGB(255, 82, 19, 94)),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Register()));
                      },
                  ),
                ]))
              ],
            )),
      ),
    );
  }
}
