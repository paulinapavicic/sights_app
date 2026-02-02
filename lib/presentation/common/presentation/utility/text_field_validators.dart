import 'package:flutter/material.dart';



String? validateEmailTextField(BuildContext context, final String? value) {
  if (value == null || value.isEmpty) {
    return "Field is empty";
  }
  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
    return "Invalid email address";
  }
  return null;
}