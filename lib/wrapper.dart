import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tugas_akhir/login_page.dart';
import 'package:tugas_akhir/change_profil.dart';
import 'package:tugas_akhir/profil.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const profil();
          } else {
            return const LoginPage();
          }
        });
  }
}
