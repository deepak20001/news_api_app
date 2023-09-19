import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screens/first_screen/first_screen.dart';
import 'package:news_app/services/auth_service/auth_service.dart';
import '../../../constants/routes.dart';
import '../forgot_password_screen/forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late bool hidepassword;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

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
                  controller: password,
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
                    onPressed: () {
                      Routes.instance.push(
                          widget: const ForgotPasswordScreen(),
                          context: context);
                    },
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
                    padding: const EdgeInsets.symmetric(
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
                      onPressed: () {
                        Routes.instance.push(
                            widget: FirstScreen(index: 1), context: context);
                      },
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
        const SizedBox(height: 18),
        GestureDetector(
          onTap: () {
            authService.signInWithEmail(email.text, password.text);
          },
          child: Container(
            padding: const EdgeInsets.fromLTRB(180, 25, 0, 0),
            height: 60,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(42),
                topRight: Radius.circular(42),
              ),
            ),
            child: const Text(
              "LOGIN",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
