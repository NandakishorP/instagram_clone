import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/main.dart';

class VerificationView extends StatefulWidget {
  const VerificationView({super.key});

  @override
  State<VerificationView> createState() => _VerificationViewState();
}

class _VerificationViewState extends State<VerificationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Verify Email',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                'Please check your email address for the verification email',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            TextButton(
                onPressed: () async {
                  final user = FirebaseAuth.instance.currentUser;
                  await user?.sendEmailVerification();
                  final finaluser = FirebaseAuth.instance.currentUser;
                  final emailVerifired = finaluser?.emailVerified ?? false;
                  if (!context.mounted) return;

                  if (emailVerifired) {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) {
                          return HomePage();
                        },
                      ),
                      (route) => false,
                    );
                  }
                },
                child: const Text("Didn't recieve it. Send again..!"))
          ],
        ),
      ),
    );
  }
}
