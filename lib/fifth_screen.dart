import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_first_app/last_screen.dart';

class FifthScreen extends StatelessWidget {
  const FifthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fifth Page"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Fifth Page",style: TextStyle(fontSize: 21),),
            TextButton.icon(
              icon: const Icon(Icons.exit_to_app),
              onPressed:(){
                // ShowDialog Box

                showDialog(
                    context: context,
                    builder: (context) {
                      // Using dialog
                      return  Dialog(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text("Exit App?"),
                            const Text("Are you sure you want to exit app?"),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                TextButton(
                                    onPressed: (){
                                      Navigator.of(context).pop();


                                },
                                    child: const Text("Cancel"),
                                ),

                                TextButton(
                                  onPressed: (){
                                    SystemNavigator.pop();


                                  },
                                  child: const Text("Exit?"),
                                ),
                              ],

                            ),
                          ],
                        ),
                      );
                      
                    },);
                /// Go out side of the app
               // SystemNavigator.pop();

              },
              label: const Text("Exit"),


            ),
            TextButton.icon(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const LastScreen(),));

            }, icon: const Icon(Icons.arrow_forward),
              label: const Text("Go to next"),
            ),

          ],
        ),
      ),


    );
  }
}
