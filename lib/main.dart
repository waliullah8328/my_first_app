import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_first_app/last_screen.dart';
import 'package:my_first_app/second_screen.dart';
import 'package:get_storage/get_storage.dart';


Future<void> main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final box = GetStorage();
  @override
  void initState() {
    _stratFatch();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child:  Scaffold(
        appBar: AppBar(
          title: const Text("First Page"),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("First Page",style: TextStyle(fontSize: 21),),
              ElevatedButton(
                  onPressed:(){
                    showModalBottomSheet(
                      //  show modal Bottom sheet,Until button click
                      isDismissible: false,
                        context: context,
                        builder: (context) {
                          return Container(
                            height: 200,
                            color: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Modal Bottom Sheet Content"),
                                const SizedBox(height: 20,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                        onPressed: (){
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Cancel"),
                                    ),
                                    TextButton.icon(

                                        onPressed: (){
                                          SystemNavigator.pop();

                                        },icon:const Icon(Icons.exit_to_app),

                                      label: const Text("Exit"),

                                    ),
                                  ],
                                ),


                              ],
                            ),
                          );
                        },
                    );

                  },
                  child: const Text("Action")),
              TextButton.icon(
                icon: const Icon(Icons.arrow_forward),
                  onPressed:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondScreen(),));

                  },
                  label: const Text("Go to next"),


              ),

              ElevatedButton(onPressed: (){
                final snacbar = SnackBar(
                    content: const Text("This is Snackbar"),
                  action: SnackBarAction(label: "Delete", onPressed: (){

                  }),
                );
                ScaffoldMessenger.of(context).showSnackBar(snacbar);

              }, child: const Text("Snackbar")),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children:  [
               const DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                  child: Text("Drawer Header")),
               const ListTile(

                leading: Icon(Icons.home),
                title: Text("Home"),
              ),
               const ListTile(

                leading: Icon(Icons.settings),
                title: Text("Setting"),
              ),
              const ListTile(

                leading: Icon(Icons.help),
                title: Text("Help"),
              ),
              const SizedBox(height: 320,),
              Row(

                mainAxisAlignment: MainAxisAlignment.end,

                children: [
                  TextButton(onPressed: (){
                    Navigator.pop(context);

                  }, child: const Text("Cancel")),
                  TextButton.icon(
                      onPressed: (){
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text("Exit App?"),
                                content: const Text("Are you sure you wan to exit the app?"),
                                actions: [
                                  TextButton.icon(
                                      onPressed: (){
                                        Navigator.pop(context);

                                      },
                                      icon: const Icon(Icons.cancel),
                                  label: const Text("Cancel"),),
                                  TextButton.icon(
                                    onPressed: (){
                                      SystemNavigator.pop();

                                    },
                                    icon: const Icon(Icons.exit_to_app),
                                    label: const Text("Exit"),),
                                ],

                              );
                            },
                        );
                        //SystemNavigator.pop();

                      },
                    icon: const Icon(Icons.exit_to_app),
                    label: const Text("Exit"),
                  ),
                ],
              ),
            ],
          ),
        ),


      ),
    );
  }

   void _stratFatch() {
    Timer(const Duration(seconds: 2), () {
      if(box.read("lastScreen")??false){
        debugPrint("LastScreen already seen");
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LastScreen(),), (route) => false);

      }
      else{
        debugPrint("LastScreen dont seen");
      }
    });
  }
}
