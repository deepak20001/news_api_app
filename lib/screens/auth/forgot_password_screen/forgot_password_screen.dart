import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../services/auth_service/auth_service.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    AuthService authService = AuthService();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Reset Password"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Email",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            TextField(
              controller: email,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.blueGrey),
                ),
                focusedBorder: InputBorder.none,
                suffixIcon: Icon(
                  Icons.email,
                  color: Colors.blueGrey,
                ),
                hintText: "wick@gmail.com",
              ),
              style: const TextStyle(color: Colors.blueGrey),
            ),
            const SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  String passwordResetEmail = email.text.trim();
                  authService.forgotPassword(passwordResetEmail, context);
                },
                child: const Text("Forgot Password"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
