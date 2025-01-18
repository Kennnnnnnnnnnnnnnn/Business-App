import 'package:business_project/login/register.dart';
import 'package:business_project/login/user_info.dart';
import 'package:business_project/reuseable_classes.dart';
import 'package:business_project/screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

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
            color: const Color.fromARGB(255, 211, 196, 219),
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Logo('shoeLogo'),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Step & Stride',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25, 
                    fontFamily:
                        'Poppins', 
                    letterSpacing:
                        1.5, 
                    shadows: [
                      Shadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 4,
                        offset: Offset(2, 2), 
                      ),
                    ],
                  ),
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
                    onPressed: () async {
                      await signIp();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Screen()));
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
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
