import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tonomo/Provider/statemanage.dart';
import 'package:tonomo/Screens/signin_screen.dart';

void main() {
 runApp(ChangeNotifierProvider(create: (_)=> StateManagement(), child: const MyApp(),));  
}


double screenHeight = 0; 
double screenWidth = 0;

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignInScreen(),
    );
  }
}