// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class AddData extends StatefulWidget {
//   const AddData({Key? key}) : super(key: key);

//   @override
//   State<AddData> createState() => _AddDataState();
// }

// class _AddDataState extends State<AddData> {
//   //Menyiapkan collection mahasiswa
//   final CollectionReference users =
//       FirebaseFirestore.instance.collection('users');
//   //Menyiapkan TextEditingController agar data dari textformfield dapat digunakan.
//   final TextEditingController noteController = TextEditingController();

//   //Menyiapkan Key untuk form
//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Add Data'),
//         centerTitle: true,
//       ),
//       body: Container(
//           margin: EdgeInsets.symmetric(
//               horizontal: MediaQuery.of(context).size.width * 00.06,
//               vertical: MediaQuery.of(context).size.height * 00.03),
//           //Membuat sebuah form agar dapat melakukan validasi untuk TextFormField
//           child: Form(
//               key: _formKey,
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.only(
//                         bottom: MediaQuery.of(context).size.height * 00.02),
//                     child: TextFormField(
//                       controller: noteController,
//                       decoration: const InputDecoration(
//                           border: OutlineInputBorder(), labelText: 'NPM'),
//                       //Validasi TextFormField
//                       validator: (value) {
//                         if (value!.isEmpty ||
//                             !RegExp(r'^[0-9]').hasMatch(value)) {
//                           return 'NPM Hanya Boleh Angka';
//                         } else {
//                           return null;
//                         }
//                       },
//                     ),
//                   ),
//                   Container(
//                     margin: EdgeInsets.only(
//                         top: MediaQuery.of(context).size.height * 0.02),
//                     width: double.infinity,
//                     height: MediaQuery.of(context).size.height * 0.05,
//                     child: ElevatedButton(
//                         onPressed: () {
//                           //Melakukan validasi form sebelumnya ketika tombol ditekan, bila telah sesuai maka setState addMahasiswa
//                           if (_formKey.currentState!.validate()) {
//                             setState(() {
//                               //Menyimpan data ke database
//                               addMahasiswa(context);
//                             });
//                           }
//                         },
//                         child: const Text('Tambah Data')),
//                   )
//                 ],
//               ))),
//     );
//   }

//   Future addMahasiswa(BuildContext context) async {
//     //Menyiapkan referensi dokumen yang akan disimpan nanti
//     DocumentReference docReference = users.doc();

//     //Menyimpan data ke dalam database
//     docReference.set({
//       'note': noteController.text.trim(),

//       //Jika set berhasil maka tampilkan sebuah Snack Bar setelah itu kembali ke halaman sebelumnya.
//     }).then((value) => ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Data Berhasil Ditambahkan'))));
//     Navigator.pop(context);
//   }
// }
