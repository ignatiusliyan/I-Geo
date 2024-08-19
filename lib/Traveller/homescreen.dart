import 'package:flutter/material.dart';

class TravellerDash extends StatefulWidget {
  const TravellerDash({super.key});

  @override
  State<TravellerDash> createState() => _TravellerDashState();
}

class _TravellerDashState extends State<TravellerDash> {
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
                      Text('Traveller  ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30
                        ),),
                      Icon(Icons.directions_bike,
                        color:Colors.amber,
                        size: 30,
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Text('Sign in',
                    style: TextStyle(
                        fontSize: 18
                    ),),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Don\'t have an account'),
                TextButton(onPressed: (){},
                    child: Text('Register?',
                    style: TextStyle(
                      color: Colors.blue
                    ),))
              ],
            ),
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
                onPressed: (){},
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
                  Text('Sign in with Google')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

