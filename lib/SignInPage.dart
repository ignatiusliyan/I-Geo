import 'package:flutter/material.dart';
import 'package:geolocation/RegisterPage.dart';
import 'package:geolocation/travellerr_followee.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Signinpage extends StatefulWidget {
  const Signinpage({super.key});

  @override
  State<Signinpage> createState() => _SigninpageState();
}

class _SigninpageState extends State<Signinpage> {


  final FirebaseAuth _auth =FirebaseAuth.instance;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formkey =GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SingleChildScrollView(
              child:Form(
                key:formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('I-Geo',
                          style: TextStyle(
                            color: Colors.amber,
                              fontWeight: FontWeight.bold,
                              fontSize: 40
                          ),),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Text('Sign in',
                      style: TextStyle(
                          fontSize: 20
                      ),),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Don\'t have an account'),
                TextButton(onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (BuildContext context)=>Registerpage())
                  );
                },
                    child: Text('Register?',
                      style: TextStyle(
                          color: Colors.blue
                      ),))
              ],
            ),
            Text('Email'),
            SizedBox(height: 10,),
            TextFormField(
              controller: emailController,
              validator: (value){
                if(value!.isEmpty || !RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}").hasMatch(value)){
                  return "Enter valid Email";
                }
                else{
                  return null;
                }
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15,),
            Text('Password'),
            SizedBox(height: 10,),
            TextFormField(
              controller: passwordController,
              validator: (value){
                if(value!.isEmpty || !RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$").hasMatch(value)){
                  return "Enter valid Password";
                }
                else{
                  return null;
                }
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10,),
            Center(
              child: OutlinedButton(
                onPressed: ()async{
                  // if(passwordController.text!=repassController.text){
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //     SnackBar(
                  //       content: const Text('Password Mismatch'),
                  //       action: SnackBarAction(
                  //         label: 'Action',
                  //         onPressed: () {
                  //           // Code to execute.
                  //         },
                  //       ),
                  //     ),
                  //   );
                  //   return;
                  // }
                  if(formkey.currentState!.validate()){
                    String email=emailController.text;
                    String password=passwordController.text;

                    UserCredential usercreden =await _auth.signInWithEmailAndPassword(email: email, password: password);
                    FirebaseAuth.instance.authStateChanges();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context)=>const monitor_traveller()
                        )
                    );
                  }
                },
                style:OutlinedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                ),
                child:const Text('Sign in'),
              ),
            ),
            SizedBox(height: 10,),
            // Container(
            //   padding: EdgeInsets.all(2),
            //   decoration:BoxDecoration(
            //       color: Colors.grey.shade100,
            //       borderRadius: BorderRadius.circular(5),
            //       border: Border.all(color: Colors.black)
            //   ) ,
            //   child: const Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Image(
            //           width:40,
            //           height:40,
            //           image: AssetImage('images/img.png')),
            //       Text('Sign in with Google')
            //     ],
            //   ),
            // )
          ],
        ),
      )
    );
  }

  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
