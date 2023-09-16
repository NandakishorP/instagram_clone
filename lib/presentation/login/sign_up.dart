import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram_clone/main.dart';
import 'package:instagram_clone/presentation/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_clone/presentation/login/login_view.dart';
import 'package:instagram_clone/presentation/login/verify_email_view.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  late final TextEditingController _confirmpassword;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    _confirmpassword = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _confirmpassword.dispose();
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
                      controller: _confirmpassword,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          border: InputBorder.none,
                          hintText: ' confirm password',
                          hintStyle: TextStyle(
                            color: Colors.white,
                          )),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SizedBox(
                width: 50,
                height: 45,
                child: ElevatedButton(
                  onPressed: () async {
                    final email = _email.text;
                    final password = _password.text;
                    final confirmpassword = _confirmpassword.text;
                    if (email.isEmpty ||
                        password.isEmpty ||
                        confirmpassword.isEmpty) {
                      return;
                    } else if (password != confirmpassword) {
                      return;
                    }
                    try {
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: email,
                        password: password,
                      );
                      if (!context.mounted) return;
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return const VerificationView();
                        },
                      ));
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        final snackbar = buildSnackBar(
                          'Use a strong password of string and numbers',
                        );
                        if (!context.mounted) return;
                        FocusScope.of(context).unfocus();
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        return;
                      } else if (e.code == 'email-already-in-use') {
                        final snackbar = buildSnackBar('user already exist');
                        if (!context.mounted) return;
                        FocusScope.of(context).unfocus();
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        return;
                      } else if (e.code == 'invalid-email') {
                        final snackbar = buildSnackBar(e.code);
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
                          builder: (context) => HomePage(),
                        ),
                        (route) => false,
                      );
                    } else {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          user?.sendEmailVerification();
                          return const VerificationView();
                        },
                      ));
                    }
                  },
                  child: const Text('Register'),
                ),
              ),
            ),
            kdoubleheight,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account ? ",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Login'))
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
