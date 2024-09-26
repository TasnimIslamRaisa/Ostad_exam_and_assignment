import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapHomeScreen extends StatefulWidget {
  const GoogleMapHomeScreen({super.key});

  @override
  State<GoogleMapHomeScreen> createState() => GoogleMapHomeScreenState();
}

class GoogleMapHomeScreenState extends State<GoogleMapHomeScreen> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      //bearing: 192.8334901395799,
      target: LatLng(22.3770642, 91.8458783),
      //tilt: 59.440717697143555,
      zoom:15.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Google Map"),
        centerTitle: true,
        backgroundColor: Colors.grey,
        elevation: 3,
      ),
      body: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kLake,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          zoomControlsEnabled: true,
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
          polylines: <Polyline>{
            // we can use multiple polyLines
            Polyline(polylineId: const PolylineId("sample"),
                color: Colors.pink,
                //width: 5,
                jointType: JointType.round,
                points: const [
                  //we can use multiple points
                  LatLng(22.3770642, 91.8458783),
                  LatLng(22.449650982036697, 91.81913992886942),

                ],
                onTap: (){
                  print('Tap on polyLines');
                }
            ),
          },
          circles: <Circle>{
            Circle(
                circleId: const CircleId('Chandga-circle'),
                center: const LatLng(22.3770642, 91.8458783),
                radius: 80,
                strokeWidth: 5,
                strokeColor: Colors.deepPurpleAccent,
                fillColor: Colors.deepPurpleAccent.withOpacity(0.15),
                onTap: (){
                  print('Tap on Chandga-Circle');
                }

            ),
            Circle(
                circleId: const CircleId('Fateyabad-circle'),
                center: const LatLng(22.449650982036697, 91.81913992886942),
                radius: 80,
                strokeWidth: 5,
                strokeColor: Colors.deepPurpleAccent,
                fillColor: Colors.deepPurpleAccent.withOpacity(0.15),
                onTap: (){
                  print('Tap on Fateyabad-Circle');
                }

            ),
          },
          polygons: <Polygon>{
            Polygon(
              polygonId: const PolygonId('polygon'),
              visible: true,
              fillColor: Colors.pink.withOpacity(0.15),
              points: [],
            ),
          },
          markers: <Marker>{
            Marker(
                markerId: const MarkerId('Marker'),
                position: const LatLng(22.3770642, 91.8458783),
                infoWindow: const InfoWindow(
                  title: "Marker",
                ),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueRose
                )
            ),
          }
      ),
      /*floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('To the lake!'),
        icon: const Icon(Icons.directions_boat),
      ),*/
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
