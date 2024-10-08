import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram_clone/main.dart';
import 'package:instagram_clone/presentation/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_clone/presentation/login/sign_up.dart';
import 'package:instagram_clone/presentation/login/verify_email_view.dart';
import 'dart:developer' as devtools show log;

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        color: Colors.black,
        child: ListView(
          children: [
            const SizedBox(height: 200),
            Padding(
              padding: const EdgeInsets.only(left: 109),
              child: Text(
                'Instagram',
                style: GoogleFonts.satisfy(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    fontSize: 47,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: Container(
                  width: width,
                  height: 54,
                  color: Colors.grey.withOpacity(0.2),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _email,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          border: InputBorder.none,
                          hintText: 'email',
                          hintStyle: TextStyle(
                            color: Colors.white,
                          )),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: Container(
                  width: width,
                  height: 54,
                  color: Colors.grey.withOpacity(0.2),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextFormField(
                      obscureText: true,
                      autocorrect: false,
                      enableSuggestions: false,
                      style: const TextStyle(color: Colors.white),
                      controller: _password,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          border: InputBorder.none,
                          hintText: 'password',
                          hintStyle: TextStyle(
                            color: Colors.white,
                          )),
                    ),
                  )),
            ),
            kdoubleheight,
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SizedBox(
                width: 50,
                height: 45,
                child: ElevatedButton(
                  onPressed: () async {
                    final email = _email.text;
                    final password = _password.text;
                    if (email.isEmpty || password.isEmpty) {
                      return;
                    }
                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: email,
                        password: password,
                      );
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        final snackbar = buildSnackBar('User not exist');
                        if (!context.mounted) return;
                        FocusScope.of(context).unfocus();
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        return;
                      } else if (e.code == 'wrong-password') {
                        final snackbar = buildSnackBar('wrong password');
                        if (!context.mounted) return;
                        FocusScope.of(context).unfocus();
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        return;
                      } else {
                        final snackbar = buildSnackBar(e.code);
                        if (!context.mounted) return;
                        FocusScope.of(context).unfocus();
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        return;
                      }
                    }
                    if (!context.mounted) return;
                    final user = FirebaseAuth.instance.currentUser;
                    if (user == null) {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => const LoginView(),
                          ),
                          (route) => false);
                    }
                    final emailVerifired = user?.emailVerified ?? false;
                    if (emailVerifired) {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                        builder: (context) {
                          return HomePage();
                        },
                      ), (route) => false);
                    } else {
                      user?.sendEmailVerification();
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return const VerificationView();
                        },
                      ));
                    }
                  },
                  child: const Text('Login'),
                ),
              ),
            ),
            kdoubleheight,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account ? ",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SignUp()));
                    },
                    child: const Text('Sign Up'))
              ],
            )
          ],
        ),
      ),
    );
  }
}

class RegisterTextFIeld extends StatelessWidget {
  const RegisterTextFIeld({
    super.key,
    required this.width,
    required this.text,
  });

  final double width;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Container(
          width: width,
          height: 54,
          color: Colors.grey.withOpacity(0.2),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: TextFormField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  border: InputBorder.none,
                  hintText: text,
                  hintStyle: const TextStyle(
                    color: Colors.white,
                  )),
            ),
          )),
    );
  }
}

Future<SnackBar> showSnackBar(String text) async {
  final snackBar = SnackBar(
    content: Text(text),
  );

  return snackBar;
}

SnackBar buildSnackBar(String message) {
  return SnackBar(
    backgroundColor: Colors.grey.withOpacity(0.3),
    duration: const Duration(seconds: 3),
    content: Text(
      message,
      style: const TextStyle(color: Colors.white),
    ),
  );
}
