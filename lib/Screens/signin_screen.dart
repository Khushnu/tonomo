import 'package:flutter/material.dart';
import 'package:tonomo/Screens/home_screen.dart';
import 'package:tonomo/Screens/signup_screen.dart';
import 'package:tonomo/Widgets/signin_withgoogle_button.dart';
import 'package:tonomo/Widgets/signinbutton_widget.dart';
import 'package:tonomo/Widgets/spacer_widget.dart';
import 'package:tonomo/Widgets/textfield_widget.dart';
import 'package:tonomo/main.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.sizeOf(context).height;
    screenWidth = MediaQuery.sizeOf(context).width;
    print(screenHeight);
    return Scaffold(
      backgroundColor: const Color(0xffFAFAFA),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           const SSSpacerWidget(
            height: 20,
           ),
            const Text(
              'tonomo',
              style: TextStyle(
                  fontFamily: 'Altro', 
                  fontSize: 28, 
                  color: Colors.black),
            ),
            const SSSpacerWidget(
              height: 20,
            ),
            const SSSpacerWidget(
              height: 15,
            ),
          
            const Text(
              'Welcome Back!',
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 6,
            ),
            const Text(
              'Enter your login details.',
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 20,
                  color: Colors.grey,
                  fontWeight: FontWeight.normal),
            ),
            const SizedBox(
              height: 35,
            ),
            Container(
              height: screenHeight < 700 ? screenHeight * 0.5  :  screenHeight * 0.5 +20,
              width: screenWidth * 0.4 - 50,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.withOpacity(0.3))),
              child: Column(
                children: [
                   SizedBox(
                    height:screenHeight < 700  ? 5 : 10,
                  ),
                  const SignInWithGoogleButton(),
                  SizedBox(
                    height:screenHeight < 700  ? 10 : 16,
                  ),
                  const Text('- OR -'),
                  const SizedBox(
                    height: 37,
                  ),
                  Container(
                    height:screenHeight < 700 ? screenHeight * 0.3: screenHeight * 0.3 - 20,
                    width: screenWidth * 0.5,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: const Color(0xffFAFAFA),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          ' Email',
                          style: TextStyle(
                              color: Colors.grey.withOpacity(0.9),
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFieldWidget(
                          height: screenHeight < 700 ? screenHeight * 0.1 - 40 : screenHeight * 0.1 - 40,
                          hintText: 'Enter your email',
                          textFieldWidth: screenWidth * 0.5 - 40,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Text(
                          ' Password',
                          style: TextStyle(
                              color: Colors.grey.withOpacity(0.9),
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFieldWidget(
                          height: screenHeight < 700 ? screenHeight * 0.1 - 40 : screenHeight * 0.1 - 40,
                          hintText: 'Enter your password',
                          textFieldWidth: screenWidth * 0.5 - 40,
                          prefix: const Icon(Icons.visibility_off),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SignInButtonWidget(
                    height: screenHeight < 700 ? screenHeight * 0.1 - 80 : screenHeight * 0.1 - 60,
                      width:  screenWidth * 0.4,
                      title: 'Sign In',
                      bgColor: const Color(0xffF6F6F6), 
                      ontap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomeScreen()));
                      },)
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
              GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=> const SignupScreen()));
              },
              child: RichText(
                text: const TextSpan(
                text: 'Don\'t have an account ? ', 
                style: TextStyle(color: Colors.black, fontSize: 16,),
               children: [
                TextSpan(
                  text: 'SignUp', 
                  style: TextStyle(color: Colors.blue, fontSize: 16,)
                )
               ]
              )),
            )
          ],
        ),
      ),
    );
  }
}