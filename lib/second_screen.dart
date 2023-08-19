import 'package:flutter/material.dart';
import 'package:my_first_app/third_screen.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Page"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Second Page",style: TextStyle(fontSize: 21),),
            TextButton.icon(
              icon: const Icon(Icons.arrow_forward),
              onPressed:(){

                // Go to the first page
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ThirdScreen(),));

              },
              label: const Text("Go to next"),


            )
          ],
        ),
      ),


    );
  }
}
