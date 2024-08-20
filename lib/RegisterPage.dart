import 'package:flutter/material.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
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
            const SingleChildScrollView(
              child:Column(
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
            SizedBox(height: 20,),
            Text('Email'),
            SizedBox(height: 10,),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15,),
            Text('Password'),
            SizedBox(height: 10,),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10,),
            Center(
              child: OutlinedButton(
                onPressed: (){
                  Navigator.pop(context);
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
            Container(
              padding: EdgeInsets.all(2),
              decoration:BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.black)
              ) ,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                      width:40,
                      height:40,
                      image: AssetImage('images/img.png')),
                  Text('Sign up with Google')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
