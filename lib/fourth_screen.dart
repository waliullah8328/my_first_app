import 'package:flutter/material.dart';
import 'package:my_first_app/fifth_screen.dart';
import 'package:my_first_app/last_screen.dart';

class FourScreen extends StatelessWidget {
  const FourScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fourth Page"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Fourth Page",style: TextStyle(fontSize: 21),),
            TextButton.icon(
              icon: const Icon(Icons.arrow_forward),
              onPressed:(){
                // Going next page , before page remove
               Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const FifthScreen(),), (route) => false);


              },
              label: const Text("Go to next"),


            )
          ],
        ),
      ),


    );
  }
}
