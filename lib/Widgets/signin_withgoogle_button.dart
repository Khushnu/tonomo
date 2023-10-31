import 'package:flutter/material.dart';
import 'package:tonomo/main.dart';

class SignInWithGoogleButton extends StatefulWidget {
  const SignInWithGoogleButton({super.key});

  @override
  State<SignInWithGoogleButton> createState() => _SignInWithGoogleButtonState();
}

class _SignInWithGoogleButtonState extends State<SignInWithGoogleButton> {
  @override
  Widget build(BuildContext context) {
     screenWidth = MediaQuery.sizeOf(context).width;  
    return Container(
      height: 50, 
      width: screenWidth * 0.5, 
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(0.4)), 
        borderRadius: BorderRadius.circular(12)
      ),
      child: Center(child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('Images/gogle.png', width: 28,), 
          const SizedBox(
            width: 20,
          ),
          const Text('Continue with Google', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),)
        ],
      )),
    );
  }
}