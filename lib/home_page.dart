import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_akhir/note.dart';
import 'package:tugas_akhir/profil.dart';
import 'package:tugas_akhir/setting.dart';
import 'package:tugas_akhir/hiragana.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
    ),
  );

  Widget _buildNoteButton() {
    return SizedBox(
      height: 50,
      width: 200,
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
          'List Users',
          style: TextStyle(
            fontFamily: 'PT-Sans',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 228, 219, 219),
          ),
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Note();
          }));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return setting();
              }));
            },
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            )),
        backgroundColor: Color(0xFF686DE0),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Learn Japanese",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ))
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              height: 180,
              margin: EdgeInsets.all(30),
              decoration: BoxDecoration(color: Color(0xFF686DE0)),
              child: Image.asset('assets/images/logo.png'),
            ),
            SizedBox(height: 50),
            _buildNoteButton(),
            SizedBox(height: 50),
            Container(
              margin: EdgeInsets.all(30),
              decoration: BoxDecoration(color: Color(0xFF686DE0)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: raisedButtonStyle,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Information"),
                            content: SizedBox(
                              height: 300,
                              child: Column(
                                children: [
                                  Text(
                                      "Hiragana is a type of letter in Japanese grammar that represents one sound like katakana, while kanji represents one meaning. Meanwhile, romaji is a letter of the Roman alphabet in general, while hiragana letters were made with katakana letters in the Nara period to the Heian period. In the past, hiragana was used by women in Japan, so the writing was smooth. Meanwhile, men use katakana more often. This seems to describe the characteristics of the hiragana characters"),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Text("Info"),
                  ),
                  ElevatedButton(
                    style: raisedButtonStyle,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Team 2"),
                            content: SizedBox(
                              height: 100,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("065119001 M Ali Yudati"),
                                  Text("065119011 Hansen Charte"),
                                  Text("065119025 Rahman Hakim"),
                                  Text("065119028 A. M. Dimas Setianto")
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Text("Contact"),
                  ),
                  ElevatedButton(
                    style: raisedButtonStyle,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("About Application"),
                            content: SizedBox(
                              height: 50,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Version : 1.0.0"),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Text("About"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
