import 'package:flutter/material.dart';

import 'Followee/homescreen.dart';
import 'Traveller/homescreen.dart';

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
          const Text('I-Geo',
            style: TextStyle(
                color: Colors.amber,
                fontWeight: FontWeight.bold,
                fontSize: 45
            ),),
          SizedBox(height: 45,),
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

