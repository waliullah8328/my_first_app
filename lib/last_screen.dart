import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';

class LastScreen extends StatefulWidget {
  const LastScreen({super.key});

  @override
  State<LastScreen> createState() => _LastScreenState();
}

class _LastScreenState extends State<LastScreen> {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Last Page"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Last Page",style: TextStyle(fontSize: 21),),
            TextButton.icon(
              icon: const Icon(Icons.exit_to_app),
              onPressed:(){
                // ShowDialog box now

                showDialog(
                    context: context,
                    builder: (context) {
                      return  AlertDialog(
                        title: const Text("Exit App?"),
                        content: const Text("Are you sure you want to exit the app?"),
                        actions: [
                          TextButton(onPressed: (){
                            Navigator.of(context).pop();

                          }, child: const Text("Cancel")),

                          TextButton(onPressed: (){
                            // Going out side of app

                            SystemNavigator.pop();
                            box.remove('lastScreen');

                          }, child: const Text("Exit")),


                        ],

                      );

                    },);
                /// Go out side of the app
               // SystemNavigator.pop();

              },
              label: const Text("Exit"),


            ),

          ],
        ),
      ),


    );
  }
}
