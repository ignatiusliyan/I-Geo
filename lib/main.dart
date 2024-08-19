import 'package:flutter/material.dart';
import 'package:geolocation/Followee/homescreen.dart';
import 'package:geolocation/Traveller/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.amberAccent,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amberAccent),
        useMaterial3: true,
      ),
      home: const monitor_traveller(),
    );
  }
}

class monitor_traveller extends StatelessWidget {
  const monitor_traveller({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text('Your Role!',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold
              ),),
          ),
          const SizedBox(height: 25,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              OutlinedButton(
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context)=>TravellerDash()));
                  },
                  style:OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                  child:const Text('Traveller'),
              ),
              const Spacer(),
              OutlinedButton(
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context)=>FolloweeDash()));

                },
                style:OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                ),
                child:const Text('Followee'),
              ),
              const Spacer()
            ],
          )
        ],
      ),
    );
  }
}
