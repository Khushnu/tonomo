import 'package:flutter/material.dart';
import 'package:tonomo/Constants/colors.dart';
import 'package:tonomo/main.dart';

class TopBarWidget extends StatefulWidget {
  const TopBarWidget({super.key});

  @override
  State<TopBarWidget> createState() => _TopBarWidgetState();
}

class _TopBarWidgetState extends State<TopBarWidget> {
  
  @override
  Widget build(BuildContext context) { 
     screenHeight = MediaQuery.sizeOf(context).height; 
    screenWidth = MediaQuery.sizeOf(context).width; 
    return Container(
      height: screenHeight * 0.1 - 35, 
      width: screenWidth,  
      color: AllColors.kTopbarColor,
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text('tonomo', style: TextStyle(fontFamily: 'Altro', fontSize: 25),), 
          const Spacer(),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: CircleAvatar(
              backgroundColor: AllColors.kNotificationButtonColor, 
              child: IconButton(onPressed: (){},
               icon: const Icon(Icons.notifications_none_outlined, color: Colors.black,))),
          ), 
          const SizedBox(width: 10,),
           CircleAvatar(
            backgroundColor: Colors.brown.shade100,
            child: const Icon(Icons.person, color: Colors.black,),
          ), 
          const SizedBox(width: 10,),
          const Text('Jhon.K', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),), 
          const SizedBox(width: 10,),
          IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert)) ,
        const SizedBox(width: 10,),
        ],
      ),
    );
  }
}