// import 'dart:developer' as dev;

// import 'package:business_project/controllers/UserController.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class DatabaseService {
//   final fire = FirebaseFirestore.instance;

  
//   Future<void> create(Usercontroller user) async {
//     try {
//       await fire.collection("users").add({
//         "name": user.name,
//         "phone": user.phone_num,
//       });
//     } catch (e) {
//       dev.log(e.toString());
//     }
//   }
// }




// class FirebaseAuthService { 
//   FirebaseAuth auth = FirebaseAuth.instance;
//   Future<User?> signUpWIthEmailAnndPasswd(String email, String password) async {
//     try {
//       UserCredential credential = await auth.createUserWithEmailAndPassword(
//           email: email, password: password);
//       return credential.user;
//     } catch (e) {
//       print("Something wrong");
//     }
//     return null;
//   }

//   Future<User?> signInWIthEmailAnndPasswd(String email, String password) async {
//     try {
//       UserCredential credential = await auth.signInWithEmailAndPassword(
//           email: email, password: password);
//       return credential.user;
//     } catch (e) {
//       print("Something wrong");
//     }
//     return null;
//   }
// }
import 'dart:developer' as dev;
import 'package:business_project/controllers/UserController.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  final fire = FirebaseFirestore.instance;

  // Use the user's unique ID for storing data
  Future<void> create(Usercontroller user) async {
    try {
      await fire.collection("users").doc(user.uid).set({
        "name": user.name,
        "phone": user.phone_num,
        "email": user.email,
      });
    } catch (e) {
      dev.log(e.toString());
    }
  }

  // Fetch user data based on user ID
  Future<Usercontroller?> getUserData(String uid) async {
    try {
      DocumentSnapshot doc = await fire.collection("users").doc(uid).get();
      if (doc.exists) {
        return Usercontroller(
          uid: uid,
          name: doc['name'],
          phone_num: doc['phone'],
          email: doc['email'],
        );
      }
    } catch (e) {
      dev.log(e.toString());
    }
    return null;
  }
}

class FirebaseAuthService { 
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<User?> signUpWIthEmailAnndPasswd(String email, String password) async {
    try {
      UserCredential credential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      print("Something wrong");
    }
    return null;
  }

Future<User?> signInWithEmailAndPassword(String email, String password) async {
  try {
    UserCredential credential = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credential.user;
  } catch (e) {
    print("Something went wrong: $e");
    return null;
  }
}
}
