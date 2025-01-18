import 'package:flutter/material.dart';
import 'package:business_project/login/databaseService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:business_project/controllers/UserController.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  DatabaseService dbService = DatabaseService();
  Usercontroller? userData;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  void fetchUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Usercontroller? fetchedUser = await dbService.getUserData(user.uid);
      setState(() {
        userData = fetchedUser;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: userData == null
          ? Center(child: CircularProgressIndicator())
          : Container(
              color: const Color.fromARGB(255, 211, 196, 219),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Profile Picture
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage("assets/shoeLogo.png"),
                    ),
                    SizedBox(height: 20),

                    // User Name
                    Text(
                      userData!.name,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),

                    // User Role or Tagline
                    Text(
                      "Software Developer",  // You can replace this with a dynamic field if needed
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20),

                    // Additional Information
                    Card(
                      color: const Color.fromARGB(255, 220, 196, 194),
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          children: [
                            // Example: Email
                            ListTile(
                              leading: Icon(Icons.email, color: Colors.blueAccent),
                              title: Text("Email"),
                              subtitle: Text(userData!.email),
                            ),
                            Divider(height: 1),

                            // Example: Phone
                            ListTile(
                              leading: Icon(Icons.phone, color: Colors.greenAccent),
                              title: Text("Phone"),
                              subtitle: Text(userData!.phone_num),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    // Edit Profile Button
                    ElevatedButton(
                      onPressed: () {
                        // Add your action here
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: const Color.fromARGB(255, 220, 196, 194),
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        'Edit Profile',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
