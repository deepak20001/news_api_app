import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showMessage(String message) {
  Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0);
}

bool isPasswordValid(String text) {
  // Check if the text contains at least one capital letter
  if (!RegExp(r'[A-Z]').hasMatch(text)) {
    showMessage("Check if the text contains at least one capital letter");
    return false;
  }

  // Check if the text contains at least one special character
  if (!RegExp(r'[!@#\$%^&*()\-_+=\[\]{}|:;<>.,?]').hasMatch(text)) {
    showMessage("Check if the text contains at least one special character");
    return false;
  }

  // Check if the text has a length of 8 characters
  if (text.length != 8) {
    showMessage("Check if the text has a length of 8 characters");
    return false;
  }

  // If all conditions pass, the password is valid
  return true;
}

bool signUpValidation(
    String email, String password, String name, String phone) {
  if (email.isEmpty && password.isEmpty && name.isEmpty && phone.isEmpty) {
    showMessage("All Fields are empty");
    return false;
  } else if (name.isEmpty) {
    showMessage("Name is Empty");
    return false;
  } else if (email.isEmpty) {
    showMessage("Email is Empty");
  } else if (phone.isEmpty) {
    showMessage("Phone number is Empty");
  } else if (password.isEmpty) {
    showMessage("Password is Empty");
    return false;
  } else if (isPasswordValid(password) == false) {
    // showMessage("Password is not strong");
    return false;
  }
  return true;
}
