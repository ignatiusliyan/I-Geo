import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocation/SignInPage.dart';
import 'package:geolocation/mapGoogle.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FolloweeDash extends StatefulWidget {
  const FolloweeDash({super.key});

  @override
  State<FolloweeDash> createState() => _FolloweeDashState();
}

class _FolloweeDashState extends State<FolloweeDash> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  Completer<GoogleMapController> _controller = Completer();
  late Stream<bool> _mapVisibilityStream;

  // final LatLng _center = const LatLng(45.521563, -122.677433);

  @override
  void initState() {
    super.initState();
    // Create a stream that emits `true` after a delay of 3 seconds
    _mapVisibilityStream = Stream<bool>.periodic(Duration(seconds: 3), (x) => true).take(1);
  }


  // void _onMapCreation(GoogleMapController controller){
  //   mapController=controller;
  //   _isMapReady=true;
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Followee'),
        actions: [
          IconButton(
              onPressed: (){
                _auth.signOut();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (BuildContext context)=>Signinpage()));
              },
              icon: Icon(Icons.logout_outlined))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black54)
              ),
              child: ListTile(
                title: Text('ignatiusliyan@gmail.com'),
                subtitle: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (BuildContext context)=>Mapgoogle()));
                      },
                      child: Icon(
                        Icons.adjust_sharp,
                        color: Colors.green,
                        size:17,
                      ),
                    ),
                    Text('Sharing'
                      ,style:TextStyle(
                        color: Colors.green
                      ) ,)
                  ],
                ),
                trailing: IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.visibility_sharp,color: Colors.amber,),
                ),
              ),
            ),
            SizedBox(height: 20,),
      StreamBuilder<bool>(
        stream: _mapVisibilityStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // Show a loading spinner while waiting
          } else if (snapshot.hasData && snapshot.data == true) {
            return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
              width: MediaQuery.of(context).size.width,
              height: 500,
              child: GoogleMap(
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                initialCameraPosition: CameraPosition(
                  target: LatLng(37.42796133580664, -122.085749655962),
                  zoom: 14.4746,
                ),
              ),
            );
          } else {
            return Text('Error: Could not load map');
          }
        },
      )
          ],
        ),
      ),
    );
  }
  @override
  void dispose() {
    // Dispose the GoogleMapController if it's initialized
    _controller.future.then((controller) {
      controller.dispose();
    });

    super.dispose();
  }
}
