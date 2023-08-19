import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_first_app/fourth_screen.dart';
import 'package:my_first_app/last_screen.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Third Page"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Third Page",style: TextStyle(fontSize: 21),),
            TextButton.icon(
              icon: const Icon(Icons.arrow_forward),
              onPressed:(){
                box.write('lastScreen',true);
                debugPrint("ThirdScreen now active");
               Navigator.push(context, MaterialPageRoute(builder: (context) => const FourScreen(),));


              },
              label: const Text("Go to next"),


            ),
            TextButton.icon(
              icon: const Icon(Icons.arrow_back),
              onPressed:(){
                /// Go back previous Screen
                Navigator.pop(context);

              },
              label: const Text("Go Back"),


            ),
          ],
        ),
      ),


    );
  }
}
