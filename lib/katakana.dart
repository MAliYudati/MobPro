import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tugas_akhir/setting.dart';
import 'package:webview_flutter/webview_flutter.dart';

class katakana extends StatefulWidget {
  const katakana({Key? key}) : super(key: key);

  @override
  State<katakana> createState() => _katakanaState();
}

class _katakanaState extends State<katakana> {
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
          "Katakana",
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
        initialUrl: 'https://www.tofugu.com/japanese/learn-katakana/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
