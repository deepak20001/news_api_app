import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screens/first_screen/first_screen.dart';
import 'package:news_app/screens/news_display_screen/news_display_screen.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.blueGrey,
              ),
            );
          }
          if (snapshot.hasData) {
            return const NewsDisplayScreen();
          } else {
            return const FirstScreen();
          }
        },
      ),
    );
  }
}
