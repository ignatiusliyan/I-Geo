import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {

  final formkey =GlobalKey<FormState>();

  final FirebaseAuth _auth =FirebaseAuth.instance;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repassController = TextEditingController();


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
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Welcome to ',
                        style: TextStyle(
                          fontSize: 30
                        ),),
                        Text('I-Geo',
                          style: TextStyle(
                              color: Colors.amber,
                              fontWeight: FontWeight.bold,
                              fontSize: 40
                          ),),
                      ],
                    ),
                    Text('Register',
                      style: TextStyle(
                          fontSize: 20
                      ),),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
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
            SizedBox(height: 15,),
            Text('Re-Type Password'),
            SizedBox(height: 10,),
            TextFormField(
              controller: repassController,
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
            // SizedBox(height: 10,),
            SizedBox(height: 10,),
            Center(
              child: OutlinedButton(
                onPressed: ()async{
                  if(passwordController.text!=repassController.text){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Password Mismatch'),
                        action: SnackBarAction(
                          label: 'Action',
                          onPressed: () {
                            // Code to execute.
                          },
                        ),
                      ),
                    );
                    return;
                  }
                  if(formkey.currentState!.validate()){
                    String email=emailController.text;
                    String password=passwordController.text;

                    UserCredential usercreden =await _auth.createUserWithEmailAndPassword(email: email, password: password);
                    FirebaseAuth.instance.authStateChanges();
                    Navigator.pop(context);
                  }
                },
                style:OutlinedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                ),
                child:const Text('Sign up'),
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
            //       Text('Sign up with Google')
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    repassController.dispose();
    super.dispose();
  }
}
