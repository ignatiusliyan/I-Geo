import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class Mapgoogle extends StatefulWidget {
  const Mapgoogle({super.key});

  @override
  State<Mapgoogle> createState() => _MapgoogleState();
}

class _MapgoogleState extends State<Mapgoogle> {

  MapController _mapController = MapController();

  double lantitude = 12.8859036;
  double longtitude = 80.1986642;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Perform actions with MapController here
      _mapController.move(LatLng(lantitude,longtitude), 13);
    });
    print('');
    print('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
      ),
      body: FlutterMap(
              mapController:_mapController,
              options: MapOptions(
                initialCenter: LatLng(lantitude,longtitude),
                onTap: (tapPosition,latlan){
                  setState(() {
                    lantitude=latlan.latitude;
                    longtitude=latlan.longitude;
                    _mapController.move(LatLng(lantitude,longtitude),13.0);
                  });
                },// Coordinates for San Francisco
                minZoom: 13.0,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      width: 80.0,
                      height: 80.0,
                      point: LatLng(lantitude,longtitude),
                      child: Icon(Icons.location_on,color: Colors.red,size: 40,),
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
