import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> streamAuthStatus() => auth.authStateChanges();

  void signup() {}
  void login() {}
  void logout() {}
}
