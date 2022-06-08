import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tugas_akhir/profil.dart';
import 'package:tugas_akhir/provider/theme_provider.dart';
import 'package:tugas_akhir/sign_up.dart';

import 'auth_service.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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

  Widget _buildRemeberMe() {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked = value;
            });
          },
        ),
        const Text(
          'Remember me',
          style: TextStyle(
            fontFamily: 'PT-Sans',
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
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
            'Sign In',
            style: TextStyle(
              fontFamily: 'PT-Sans',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 228, 219, 219),
            ),
          ),
          onPressed: () async {
            await AuthServices.signIn(
                emailController.text.trim(), passwordController.text.trim());
          }),
    );
  }

  Widget _buildSignUpQuestion() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Do not have an Account? ',
          style: TextStyle(
            fontFamily: 'PT-Sans',
            fontSize: 16,
          ),
        ),
        InkWell(
          child: const Text(
            'Sing Up',
            style: TextStyle(
              fontFamily: 'PT-Sans',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 80, 69, 230),
            ),
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return SignUpPage();
            }));
          },
        ),
      ],
    );
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
                  'LOGIN',
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
                  height: 15,
                ),
                _buildRemeberMe(),
                const SizedBox(
                  height: 15,
                ),
                _buildLoginButton(),
                const SizedBox(
                  height: 20,
                ),
                _buildSignUpQuestion()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
