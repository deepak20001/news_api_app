import 'package:flutter/material.dart';
import 'package:news_app/screens/auth/login_screen/login_screen.dart';
import 'package:news_app/screens/auth/signup_screen/signup_screen.dart';

// ignore: must_be_immutable
class FirstScreen extends StatefulWidget {
  int index;
  FirstScreen({super.key, this.index = 0});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  // late int index;

  @override
  void initState() {
    super.initState();
    // index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News App"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.transparent),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(42),
                  bottomRight: Radius.circular(42),
                ),
              ),
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        if (widget.index != 0) widget.index = 0;
                        setState(() {
                          print(widget.index);
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: widget.index == 0 ? Colors.blueGrey : Colors.white,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "LOGIN",
                            style: TextStyle(
                              fontSize: 16,
                              color:
                                  widget.index == 0 ? Colors.grey[300] : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        if (widget.index != 1) widget.index = 1;
                        setState(() {
                          print(widget.index);
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: widget.index == 1 ? Colors.blueGrey : Colors.white,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "SIGNUP",
                            style: TextStyle(
                              fontSize: 16,
                              color:
                                  widget.index == 1 ? Colors.grey[300] : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            widget.index == 0 ? const LoginScreen() : const SignUp(),

            ///
          ],
        ),
      ),
    );
  }
}
