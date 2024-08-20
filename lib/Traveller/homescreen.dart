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
      appBar: AppBar(
        title: Text('Traveller'),
        // actions: [
        //   TextButton(
        //       onPressed: () {
        //         Navigator.pop(context);
        //         },
        //       child: Text('Leave Role'))
        // ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: Text('Let others track you by providing their \nI-Geo registered Email.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),),
              ),
              SizedBox(height: 20,),
              Text('Email'),
              SizedBox(height: 10,),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20,),
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
                  child:const Text('Share Location'),
                ),
              ),
              SizedBox(height: 15,),
              Text(' Be cautious of who you are sharing with'),
              SizedBox(height: 10,),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black54),
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Center(
                  child: Text('No persons found',style: TextStyle(color: Colors.black54),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
