import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tugas_akhir/login_page.dart';
import 'package:tugas_akhir/provider/theme_provider.dart';
import 'package:tugas_akhir/widget/change_theme_button_widget.dart';
import 'package:tugas_akhir/wrapper.dart';

class setting extends StatelessWidget {
  Widget _buildLoginButton() {
    return SizedBox(
      height: 50,
      width: 100,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Color.fromARGB(255, 80, 69, 230),
          ),
          elevation: MaterialStateProperty.all(6),
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        ),
        child: const Text(
          'Sign Out',
          style: TextStyle(
            fontFamily: 'PT-Sans',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 228, 219, 219),
          ),
        ),
        onPressed: () async {
          await FirebaseAuth.instance.signOut();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF686DE0),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        title: const Text(
          "Setting",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Dark Mode",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold, fontSize: 25),
                ),
                SizedBox(
                  width: 60,
                ),
                ChangeThemeButtonWidget(),
              ],
            ),
            Divider(
              thickness: 3,
            ),
            _buildLoginButton(),
          ],
        ),
      ),
    );
  }
}
