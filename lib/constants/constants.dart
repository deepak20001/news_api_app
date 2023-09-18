import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showMessage(String message, Color color) {
  Fluttertoast.showToast(
      msg: message,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0);
}

String getMessageFromErrorCode(String errorCode) {
  switch (errorCode) {
    case ("auth/email-already-in-use"):
      {
        return "The email address is already in use.";
      }
    case ("auth/invalid-email"):
      {
        return "The email address is not valid.";
      }
    case ("auth/weak-password"):
      {
        return "The password is not strong enough.";
      }
    case ("auth/wrong-password"):
      {
        return "The password is invalid for the given email, or the account corresponding to the email doesn't have a password set.";
      }
    case ("auth/user-not-found"):
      {
        return "There is no user corresponding to the given email.";
      }
    case ("auth/network-error"):
      {
        return "There was a network error.";
      }
    default:
      return "An unknown error occurred.";
  }
}

bool loginValidation(String email, String password) {
  if (email.isEmpty && password.isEmpty) {
    showMessage("Both Fields are empty", Colors.red);
    return false;
  } else if (email.isEmpty) {
    showMessage("Email is Empty", Colors.red);
    return false;
  } else if (password.isEmpty) {
    showMessage("Password is Empty", Colors.red);
  }
  return true;
}

bool isPasswordValid(String text) {
  // Check if the text contains at least one capital letter
  if (!RegExp(r'[A-Z]').hasMatch(text)) {
    showMessage(
        "Check if the text contains at least one capital letter", Colors.red);
    return false;
  }

  // Check if the text contains at least one special character
  if (!RegExp(r'[!@#\$%^&*()\-_+=\[\]{}|:;<>.,?]').hasMatch(text)) {
    showMessage("Check if the text contains at least one special character",
        Colors.red);
    return false;
  }

  // Check if the text has a length of 8 characters
  if (text.length != 8) {
    showMessage("Check if the text has a length of 8 characters", Colors.red);
    return false;
  }

  // If all conditions pass, the password is valid
  return true;
}

bool signUpValidation(
    String email, String password, String name, String phone, bool isChecked) {
  if (email.isEmpty && password.isEmpty && name.isEmpty && phone.isEmpty) {
    showMessage("All Fields are empty", Colors.red);
    return false;
  } else if (name.isEmpty) {
    showMessage("Name is Empty", Colors.red);
    return false;
  } else if (email.isEmpty) {
    showMessage("Email is Empty", Colors.red);
  } else if (phone.isEmpty) {
    showMessage("Phone number is Empty", Colors.red);
  } else if (password.isEmpty) {
    showMessage("Password is Empty", Colors.red);
    return false;
  } else if (isPasswordValid(password) == false) {
    showMessage("Password is not strong", Colors.red);
    return false;
  } else if (isChecked == false) {
    showMessage("Check the terms and conditions", Colors.red);
    return false;
  }
  return true;
}
