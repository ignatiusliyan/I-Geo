import 'package:flutter/material.dart';
import 'package:geolocation/SignInPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:geolocation/firebase_options.dart';
import 'package:geolocation/travellerr_followee.dart';
import 'package:firebase_auth/firebase_auth.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
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
        fontFamily: 'ChakraPetch',
        primaryColor: Colors.amberAccent,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amberAccent),
        useMaterial3: true,
      ),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.active){
            User? user =snapshot.data;
            if(user==null){
              return Signinpage();
            }
            else{
              return monitor_traveller();
            }
          }
          return Signinpage();
        },
      ),
    );
  }
}

