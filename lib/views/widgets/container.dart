import 'package:flutter/material.dart';
import 'package:hurry_project/core/resources/colors.dart';

// ignore: must_be_immutable
class MainContainer extends StatelessWidget {
  MainContainer(
      {Key? key,
      required this.context,
      required this.containerText,
      required this.onTap})
      : super(key: key);
  BuildContext context;
  String containerText;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height / 14,
        width: MediaQuery.of(context).size.width / 1.1,
        decoration: ShapeDecoration(
          color: MainColor().bottonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 26,
              offset: Offset(0, 0),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Center(
          child: Text(
            containerText,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF333333),
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}