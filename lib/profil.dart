import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas_akhir/auth_service.dart';
import 'package:tugas_akhir/change_profil.dart';
import 'package:tugas_akhir/setting.dart';
import 'package:tugas_akhir/wrapper.dart';

class profil extends StatefulWidget {
  const profil({Key? key}) : super(key: key);

  @override
  State<profil> createState() => _profilState();
}

class _profilState extends State<profil> {
  Widget _buildEditButton() {
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
          'Edit',
          style: TextStyle(
            fontFamily: 'PT-Sans',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 228, 219, 219),
          ),
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return edit();
          }));
        },
      ),
    );
  }

  Widget _buildLogoutButton() {
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
            'Delete',
            style: TextStyle(
              fontFamily: 'PT-Sans',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 228, 219, 219),
            ),
          ),
          onPressed: () async {
            await AuthServices.deleteUser(user.email);
            await AuthServices.hapusUser().then((value) =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Wrapper();
                })));
          }),
    );
  }

  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(user.email).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
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
                "Profile",
                style: TextStyle(color: Colors.white),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return setting();
                      }));
                    },
                    icon: const Icon(
                      Icons.settings,
                      color: Colors.white,
                    ))
              ],
            ),
            body: Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(35.0),
                      child: const CircleAvatar(
                        //backgroundImage: AssetImage('assets/images/PP.jpg'),
                        radius: 75,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 25, 20, 20),
                      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      decoration: BoxDecoration(
                        color: Color(0x4D686DE0),
                        border: Border.all(
                          color: Color(0xFF686DE0),
                          width: 4,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${data['name']}",
                            style: GoogleFonts.poppins(),
                          ),
                          const Divider(
                            thickness: 1,
                            color: Colors.white,
                          ),
                          Text(
                            "Email",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${data['email']}",
                            style: GoogleFonts.poppins(),
                          ),
                          const Divider(
                            thickness: 1,
                            color: Colors.white,
                          ),
                          Text(
                            "Phone Number",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${data['phone number']}",
                            style: GoogleFonts.poppins(),
                          ),
                          const Divider(
                            thickness: 1,
                            color: Colors.white,
                          ),
                          Text(
                            "Age",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${data['age']}",
                            style: GoogleFonts.poppins(),
                          ),
                          const Divider(
                            thickness: 1,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildEditButton(),
                        _buildLogoutButton(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        return Text("loading");
      },
    );
  }
}
