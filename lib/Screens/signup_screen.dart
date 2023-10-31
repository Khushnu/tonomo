import 'package:flutter/material.dart';
import 'package:tonomo/Screens/home_screen.dart';
import 'package:tonomo/Widgets/signin_withgoogle_button.dart';
import 'package:tonomo/Widgets/signinbutton_widget.dart';
import 'package:tonomo/Widgets/textfield_widget.dart';
import 'package:tonomo/main.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.sizeOf(context).height;
    screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: const Color(0xffFAFAFA),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'tonomo',
              style: TextStyle(
                  fontFamily: 'Altro', fontSize: 28, color: Colors.black),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              'First, enter your email',
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
              'We\'re suggest using the email address you use at work.',
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
              height: screenHeight * 0.6 - 60,
              width: screenWidth * 0.4 - 50,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.withOpacity(0.3))),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const SignInWithGoogleButton(),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text('- OR -'),
                  const SizedBox(
                    height: 37,
                  ),
                  Container(
                    height: screenHeight * 0.4 - 80,
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
                          ' Full Name',
                          style: TextStyle(
                              color: Colors.grey.withOpacity(0.9),
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFieldWidget(
                          hintText: 'Full Name',
                          textFieldWidth: screenWidth * 0.5 - 40,
                        ),
                        const SizedBox(
                          height: 25,
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
                          hintText: 'Email your email',
                          textFieldWidth: screenWidth * 0.5 - 40,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  ' Create Password',
                                  style: TextStyle(
                                      color: Colors.grey.withOpacity(0.9),
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextFieldWidget(
                                    hintText: 'Enter Password',
                                    textFieldWidth: screenWidth * 0.2,
                                    prefix: const Icon(Icons.visibility_off)),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  ' Repeat Password',
                                  style: TextStyle(
                                      color: Colors.grey.withOpacity(0.9),
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextFieldWidget(
                                  hintText: 'Enter Password',
                                  textFieldWidth: screenWidth * 0.2,
                                  prefix: const Icon(Icons.visibility_off),
                                ),
                              ],
                            ),
                          ),
                        ])
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SignInButtonWidget(
                      width: screenWidth * 0.4,
                      title: 'Continue',
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
                Navigator.pop(context);
              },
              child: const Text('Signin to existing account', style: TextStyle(color: Colors.blue, fontSize: 16),),
            )
          ],
        ),
      ),
    );
  }
}