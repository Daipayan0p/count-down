import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  const AuthField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.isObsecureText
  });
  final String hintText;
  final TextEditingController controller;
  final bool isObsecureText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(hintText: hintText),
        validator: (value){
          if(value!.isEmpty){
            return "$hintText is missing";
          }
          return null;
        },
        obscureText: isObsecureText,
      ),
    );
  }
}