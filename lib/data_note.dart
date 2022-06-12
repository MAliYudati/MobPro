// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class DataMahasiswa extends StatefulWidget {
//   final String id;
//   const DataMahasiswa(this.id, {Key? key}) : super(key: key);

//   @override
//   State<DataMahasiswa> createState() => _DataMahasiswaState();
// }

// class _DataMahasiswaState extends State<DataMahasiswa> {
//   final user = FirebaseAuth.instance.currentUser!;
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
//         appBar: AppBar(
//           title: const Text('Data'),
//           centerTitle: true,
//         ),
//         body: Container(
//           margin: EdgeInsets.symmetric(
//               horizontal: MediaQuery.of(context).size.width * 00.06,
//               vertical: MediaQuery.of(context).size.height * 00.03),
//           child: getMahasiswa(),
//         ));
//   }

//   //Mengambil data dari database menggunakan FutureBuilder sehingga tampilan data tidak akan langsung berubah saat data pada di database diperbarui
//   FutureBuilder<DocumentSnapshot<Object?>> getMahasiswa() {
//     return FutureBuilder(
//       //Mengambil data daru document berdasarkan id yang diperoleh pada halaman home lalu disimpan dalam snapshot
//       future: users.doc(user.email).get(),
//       builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//         //Dilakukan try and catch
//         try {
//           //Bila snapshot memiliki data maka kita isikan data tersebut ke dalam masing-masing controller
//           if (snapshot.hasData) {
//             noteController.text = snapshot.data!['name'].toString();

//             //Build widget dataMahasiswa.
//             return dataMahasiswa(context);
//           }
//         } catch (e) {
//           debugPrint(e.toString());
//         }
//         //Kembalikan tampilan loading jika terjadi sesuatu di luar dugaan.
//         return const Center(child: CircularProgressIndicator());
//       },
//     );
//   }

//   Widget dataMahasiswa(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         children: [
//           Padding(
//             padding: EdgeInsets.only(
//                 bottom: MediaQuery.of(context).size.height * 00.02),
//             child: TextFormField(
//               controller: noteController,
//               decoration: const InputDecoration(
//                   border: OutlineInputBorder(), labelText: 'NPM'),
//             ),
//           ),
//           Container(
//             margin:
//                 EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
//             width: double.infinity,
//             height: MediaQuery.of(context).size.height * 0.05,
//             child: ElevatedButton(
//                 onPressed: () {
//                   //Melakukan validasi form sebelumnya ketika tombol ditekan, bila telah sesuai maka setState updateMahasiswa
//                   if (_formKey.currentState!.validate()) {
//                     setState(() {
//                       //Memperbarui data ke database
//                       updateMahasiswa(context);
//                     });
//                   }
//                 },
//                 child: const Text('Perbarui Data')),
//           ),
//           Container(
//             margin:
//                 EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
//             width: double.infinity,
//             height: MediaQuery.of(context).size.height * 0.05,
//             child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(primary: Colors.red),
//                 onPressed: () {
//                   //Tampilkan dialog untuk verifikasi apakah benar data akan dihapus dengan AlertDialog
//                   showDialog(
//                       context: context,
//                       builder: (BuildContext context) => AlertDialog(
//                             title: const Center(
//                                 child: Text('Konfirmasi Hapus Data')),
//                             content: Text(
//                                 'Yakin ingin menghapus Mahasiswa Bernama ' +
//                                     noteController.text.trim()),
//                             actions: [
//                               //Bila tombol Ya ditekan maka jalankan deleteMahasiswa
//                               TextButton(
//                                   onPressed: () => deleteMahasiswa(context),
//                                   child: const Text('Ya')),
//                               //Bila tombol Tidak  ditekan maka pop AlertDialog
//                               TextButton(
//                                   onPressed: () =>
//                                       Navigator.pop(context, "Tidak"),
//                                   child: const Text('Tidak')),
//                             ],
//                           ));
//                 },
//                 child: const Text('Hapus Data')),
//           )
//         ],
//       ),
//     );
//   }

//   Future updateMahasiswa(BuildContext context) async {
//     //Menyiapkan referensi dokumen yang akan diperbarui
//     DocumentReference docReference = users.doc(user.email);

//     //Memperbarui data ke dalam database
//     docReference.update({
//       'name': noteController.text.trim(),

//       //Jika update berhasil maka tampilkan sebuah Snack Bar setelah itu kembali ke halaman sebelumnya.
//     }).then((value) => ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Data Mahasiswa Berhasil Diperbarui'))));
//     Navigator.pop(context);
//   }

//   Future deleteMahasiswa(BuildContext context) async {
//     //Hapus dokumen berdasarkan id yang didapat pada halaman Home, bila data berhasil dihapus maka tampilkan sebuah Snack Bar
//     users.doc(user.email).delete().then((value) => ScaffoldMessenger.of(context)
//         .showSnackBar(const SnackBar(
//             content: Text('Data Mahasiswa Berhasil Diperbarui'))));
//     //Pop dilakukan dua kali
//     //1. AlertDialog
//     //2. Halaman DataMahasiswa
//     Navigator.pop(context);
//     Navigator.pop(context);
//   }
// }
