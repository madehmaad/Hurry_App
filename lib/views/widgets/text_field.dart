import 'package:flutter/material.dart';
import 'package:hurry_project/core/resources/colors.dart';

// ignore: must_be_immutable
class MainTextField extends StatelessWidget {
  MainTextField(
      {Key? key,
      required this.context,
      required this.controller,
      required this.labelText})
      : super(key: key);

  BuildContext context;
  TextEditingController controller;
  String labelText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 14,
      width: MediaQuery.of(context).size.width / 1.1,
      decoration: ShapeDecoration(
        color: MainColor().backgroundTextFieldColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: TextField(
        style: TextStyle(color: Colors.white),
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle:
              TextStyle(color: const Color.fromARGB(146, 255, 255, 255)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
