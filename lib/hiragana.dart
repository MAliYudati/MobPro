import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tugas_akhir/setting.dart';
import 'package:webview_flutter/webview_flutter.dart';

class hiragana extends StatefulWidget {
  const hiragana({Key? key}) : super(key: key);

  @override
  State<hiragana> createState() => _hiraganaState();
}

class _hiraganaState extends State<hiragana> {
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
          "Hiragana",
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
      body: WebView(
        initialUrl: 'https://www.tofugu.com/japanese/learn-hiragana/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
