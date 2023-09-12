import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String dropDownValue = "+91";
  late bool hidepassword;
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    hidepassword = true;
  }

  @override
  Widget build(BuildContext context) {
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
                  "Create an\nAccount",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Name",
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
                      Icons.person,
                      color: Colors.blueGrey,
                    ),
                    hintText: "John Wick",
                  ),
                  style: TextStyle(color: Colors.blueGrey),
                ),
                const SizedBox(height: 10),
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
                  "Contact no",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Row(
                  children: [
                    Image.asset(
                      "assets/icons/india.png",
                      width: 35,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "IN",
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(width: 10),
                    DropdownButton<String>(
                      value: dropDownValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          dropDownValue = newValue!;
                        });
                      },
                      underline: Container(
                        color: Colors.white,
                      ),
                      items: <String>['+91', '+92', '+93', '+94']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value.toString()),
                        );
                      }).toList(),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.43,
                      child: const TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.blueGrey),
                          ),
                          focusedBorder: InputBorder.none,
                          suffixIcon: Icon(
                            Icons.phone,
                            color: Colors.blueGrey,
                          ),
                          hintText: "9876543210",
                        ),
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                    ),
                  ],
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
                Row(
                  children: [
                    SizedBox(
                      height: 12,
                      child: Checkbox(
                          value: isChecked,
                          activeColor: Colors.blueGrey,
                          onChanged: (newBool) {
                            setState(() {
                              isChecked = newBool!;
                            });
                          }),
                    ),
                    RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: const <TextSpan>[
                          TextSpan(
                            text: 'I agree with, ',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: 'terms & condition',
                            style: TextStyle(
                              color: Colors.blueGrey,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an Account ?"),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Sign In",
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