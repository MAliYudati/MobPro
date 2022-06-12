import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Note extends StatefulWidget {
  const Note({Key? key}) : super(key: key);

  @override
  State<Note> createState() => _NoteState();
}

final user = FirebaseAuth.instance.currentUser!;

class _NoteState extends State<Note> {
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List User'),
        centerTitle: true,
        backgroundColor: Color(0xFF686DE0),
        elevation: 0,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: users.orderBy("age", descending: true).snapshots(),
          builder: (context, snapshot) {
            //Mengecek apakah koneksi snapshot sedang aktif atau tidak
            if (snapshot.connectionState == ConnectionState.active) {
              //Mengecek apakah snapshot memiliki data atau kosong
              if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
                //Jika data kosong tampilkan tulisan data kosong
                return Center(
                  child: const Text('Data Kosong'),
                );
                //Jika snapshot memiliki data maka ubah bentuk map dari snapshot ke dalam sebuah widget list
              } else {
                return ListView(
                    children: snapshot.data!.docs
                        .map((e) => dataUsers(
                            email: e['email'],
                            name: e['name'],
                            age: e['age'],
                            phoneNumber: e['phone number']))
                        .toList());
              }
              //Selain koneksi aktif maka tampilkan sebuah tampilan loading
            } else {
              return const CircularProgressIndicator();
            }
          }),
    );
  }

  //Widget list yang digunakan untuk menampilkan data dari snapshot streambuilder
  Widget dataUsers(
      {String? email, String? name, String? age, String? phoneNumber}) {
    return ListTile(
      leading: Text(age! + " years old"),
      title: Text(name!),
      subtitle: Text(phoneNumber!),
    );
  }
}
