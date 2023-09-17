import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/services/auth_service/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late bool hidepassword;

  @override
  void initState() {
    super.initState();
    hidepassword = true;
  }

  @override
  Widget build(BuildContext context) {
    AuthService authService = AuthService();
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.7,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(40, 20, 43, 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Sign In to your\nAccount",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Email",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const TextField(
                  decoration: InputDecoration(
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
                  style: TextStyle(color: Colors.blueGrey),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Password",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextField(
                  obscureText: hidepassword,
                  decoration: InputDecoration(
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.blueGrey),
                    ),
                    focusedBorder: InputBorder.none,
                    suffixIcon: CupertinoButton(
                      onPressed: () {
                        hidepassword = !hidepassword;
                        setState(() {});
                      },
                      child: Icon(
                        hidepassword == true
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.blueGrey,
                      ),
                    ),
                    hintText: "Password",
                  ),
                  style: const TextStyle(color: Colors.blueGrey),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Forgot Password ?",
                      selectionColor: Colors.blueGrey,
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Text("Login with"),
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.center,
                  child: CupertinoButton(
                    onPressed: () {
                      authService.signInWithGoogle();
                    },
                    padding: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 10,
                    ),
                    color: Colors.blueGrey.shade200,
                    child: Image.asset(
                      "assets/icons/google.png",
                      width: 30,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an Account ?"),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Register Now",
                        selectionColor: Colors.blueGrey,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
