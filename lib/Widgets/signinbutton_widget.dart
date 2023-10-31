import 'package:flutter/material.dart';
import 'package:tonomo/main.dart';

class SignInButtonWidget extends StatefulWidget {
  const SignInButtonWidget(
      {super.key,
      required this.width,
      required this.title,
      required this.bgColor,
      this.ontap});
  final double width;
  final String title;
  final Color bgColor;
  final Function()? ontap;
  @override
  State<SignInButtonWidget> createState() => _SignInButtonWidgetState();
}

class _SignInButtonWidgetState extends State<SignInButtonWidget> {
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.sizeOf(context).height;
    screenWidth = MediaQuery.sizeOf(context).width;
    return GestureDetector(
      onTap: widget.ontap,
      child: Container(
        height: 40,
        width: widget.width,
        decoration: BoxDecoration(
          color: widget.bgColor,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Center(
          child: Text(
            widget.title,
            style: const TextStyle(
                color: Colors.black,
                fontFamily: 'Inter',
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
