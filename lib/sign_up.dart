import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tugas_akhir/login_page.dart';
import 'package:tugas_akhir/profil.dart';
import 'package:tugas_akhir/provider/theme_provider.dart';
import 'package:tugas_akhir/sign_up.dart';

import 'auth_service.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoginScreen();
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool? isChecked = false;

  Widget _buildTextField({
    required bool obscureText,
    Widget? prefixedIcon,
    String? hintText,
    TextEditingController? controller,
  }) {
    return Material(
      color: Colors.transparent,
      elevation: 2,
      child: TextField(
        controller: controller,
        cursorColor: Colors.white,
        cursorWidth: 2,
        obscureText: obscureText,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          border: InputBorder.none,
          filled: true,
          prefixIcon: prefixedIcon,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color.fromARGB(136, 25, 22, 26),
            fontWeight: FontWeight.bold,
            fontFamily: 'PTSans',
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpButton() {
    final _form = GlobalKey<FormState>();
    return SizedBox(
      height: 64,
      width: double.infinity,
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
          'Sign Up',
          style: TextStyle(
            fontFamily: 'PT-Sans',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 228, 219, 219),
          ),
        ),
        onPressed: () async {
          await AuthServices.addUser(nameController.text.trim(),
              emailController.text.trim(), phoneNumberController.text.trim());
          await AuthServices.createUser(nameController.text.trim(),
                  emailController.text.trim(), passwordController.text.trim())
              .then((value) => Navigator.pop(context));
        },
      ),
    );
  }

  Widget _buildSignInQuestion() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Do have an Account? ',
          style: TextStyle(
            fontFamily: 'PT-Sans',
            fontSize: 16,
          ),
        ),
        InkWell(
          child: const Text(
            'Sign In',
            style: TextStyle(
              fontFamily: 'PT-Sans',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 80, 69, 230),
            ),
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return LoginPage();
            }));
          },
        ),
      ],
    );
  }

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
            ).copyWith(top: 60),
            child: Column(
              children: [
                const Text(
                  'Create Account',
                  style: TextStyle(
                    fontFamily: 'PT-Sans',
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 80, 69, 230),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Name',
                    style: TextStyle(
                      fontFamily: 'PT-Sans',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                _buildTextField(
                  controller: nameController,
                  hintText: '',
                  obscureText: false,
                  prefixedIcon: const Icon(Icons.person, color: Colors.white),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Phone Number',
                    style: TextStyle(
                      fontFamily: 'PT-Sans',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                _buildTextField(
                  controller: phoneNumberController,
                  hintText: '',
                  obscureText: false,
                  prefixedIcon: const Icon(Icons.phone, color: Colors.white),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Email',
                    style: TextStyle(
                      fontFamily: 'PT-Sans',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                _buildTextField(
                  controller: emailController,
                  hintText: '',
                  obscureText: false,
                  prefixedIcon: const Icon(Icons.mail, color: Colors.white),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Password',
                    style: TextStyle(
                      fontFamily: 'PT-Sans',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                _buildTextField(
                  controller: passwordController,
                  hintText: '',
                  obscureText: true,
                  prefixedIcon: const Icon(Icons.lock, color: Colors.white),
                ),
                const SizedBox(
                  height: 30,
                ),
                _buildSignUpButton(),
                const SizedBox(
                  height: 20,
                ),
                _buildSignInQuestion()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
