import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  static Future signOut() async {
    _auth.signOut();

    return signOut();
  }

  static Future signIn(emailAddress, password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('Email tidak ditemukan');
      } else if (e.code == 'wrong-password') {
        print('Password salah');
      }
    }
  }

  static Future createUser(name, emailAddress, password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  static Future addUser(name, emailAddress, phoneNumber, age) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(emailAddress)
        .set({
          'name': name,
          'email': emailAddress,
          'phone number': phoneNumber,
          'age': age
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  static Future addAge(age, emailAddress) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(emailAddress)
        .set({'age': age})
        .then((value) => print("Age Added"))
        .catchError((error) => print("Failed to add age: $error"));
  }

  static Future updateUser(name, emailAddress, phoneNumber, age) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(emailAddress)
        .update({'name': name, 'phone number': phoneNumber, 'age': age})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  static Future deleteUser(emailAddress) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(emailAddress)
        .delete()
        .then((value) => print("User Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }

  static Future hapusUser() async {
    final user = FirebaseAuth.instance.currentUser;
    await user?.delete();
  }
}
