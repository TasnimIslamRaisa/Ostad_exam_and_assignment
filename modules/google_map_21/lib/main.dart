import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const HomeScreen());
}

class GoogleMapsApp extends StatelessWidget {
  const GoogleMapsApp({super.key});

  @override
  Widget build(BuildContext context) {
    late GoogleMapController _googleMapController;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            'Sample App',
          ),
        ),
        body: GoogleMap(
          mapType: MapType.terrain,
          initialCameraPosition: const CameraPosition(
            target: LatLng(22.35542888372639, 91.82072960419521),
            zoom: 16,
          ),
          onMapCreated: (GoogleMapController controller) {
            _googleMapController = controller;
          },
          onTap: (LatLng latLng) {
            print(latLng);
          },
          circles: <Circle>{
            Circle(
              circleId: const CircleId('NBS'),
              center: const LatLng(22.356067845266406, 91.81920893490314),
              radius: 280,
              strokeWidth: 5,
              strokeColor: Colors.blue,
              fillColor: Colors.cyanAccent.withOpacity(0.2),
              zIndex: 1,
              onTap: () {
                print('Circle Tapped');
              },
            )
          },
          polygons: <Polygon>{
            const Polygon(
              polygonId: PolygonId('PolyGon Id'),
              //fillColor: Colors.black,
              visible: true,
              strokeWidth: 5,
              points: [
                LatLng(22.352068736585544, 91.82085983455181),
                LatLng(22.351199255570258, 91.81777026504278),
                LatLng(22.349679821371033, 91.82365570217371),
                LatLng(22.34902211828719, 91.8196501582861)
              ],
            )
          },
          markers: <Marker>{
            Marker(
              markerId: const MarkerId('Marker'),
              position: const LatLng(22.362852454884724, 91.82254560291767),
              infoWindow: const InfoWindow(title: 'Test'),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueOrange),
              //draggable: true,
            ),
            Marker(
              markerId: const MarkerId('Marker2'),
              position: const LatLng(22.36416059602967, 91.82457905262709),
              infoWindow: const InfoWindow(title: 'Test'),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueBlue),
              draggable: true,
              onDragEnd: (LatLng lastLang) {
                print('Test');
                print(lastLang);
              },
              onDragStart: (LatLng StartLang) {
                print('Start Lang${StartLang}');
              },
              onDrag: (LatLng StartLang) {
                print('Start Lang${StartLang}');
              },
            ),
          },
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Position? _currentPosition;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Geo Location'),
        ),
        body: Center(child: Text('Current Location : ${_currentPosition}')),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _locationPermissionHandler(() {
              Geolocator.getCurrentPosition();
            });

            _locationPermissionHandler(() {
              Geolocator.getPositionStream().listen(
                (event) {
                  debugPrint(event.toString());
                },
              );
            });
            _getCurrentLocation();
            _listenCurrentLocation();
          },
          child: const Icon(Icons.location_history),
        ),
      ),
    );
  }

  Future<void> _getCurrentLocation() async {
    /*
    TODO: TOTAL 3 STEPS
    TODO : Check Permission -> Check Permission
    TODO :Check GPS Service -> Ask to on
    TODO :Get current Location
     */

    //TODO : Check Permission -> Check Permission
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      //permission granted

      //TODO :Check GPS Service -> Ask to on
      final bool isEnable = await Geolocator.isLocationServiceEnabled();
      if (isEnable) {
        //get location
        //TODO :Get current Location
        _currentPosition = await Geolocator.getCurrentPosition(
          locationSettings: const LocationSettings(
            accuracy: LocationAccuracy.best,
            distanceFilter: 10,
            timeLimit: Duration(seconds: 10),
          ),
        );
        if (mounted) {
          setState(() {});
        }
      } else {
        //On gps service
        Geolocator.openLocationSettings();
      }
    } else {
      //denied
      if (permission == LocationPermission.deniedForever) {
        Geolocator.openAppSettings();
        return;
      }
      LocationPermission p = await Geolocator.requestPermission();
      _getCurrentLocation();
    }
    //TODO :Check GPS Service -> Ask to on
    //TODO :Get current Location
  }

  Future<void> _listenCurrentLocation() async {
    /*
    TODO: TOTAL 3 STEPS
    TODO : Check Permission -> Check Permission
    TODO :Check GPS Service -> Ask to on
    TODO :Get current Location
     */

    //TODO : Check Permission -> Check Permission
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      //permission granted

      //TODO :Check GPS Service -> Ask to on
      final bool isEnable = await Geolocator.isLocationServiceEnabled();
      if (isEnable) {
        //get location
        //TODO :Get current Location
        await Geolocator.getPositionStream(
          locationSettings: const LocationSettings(
            accuracy: LocationAccuracy.best,
            distanceFilter: 10,
            timeLimit: Duration(seconds: 10),
          ),
        ).listen(
          (pos) {
            print(pos);
          },
        );
        if (mounted) {
          setState(() {});
        }
      } else {
        //On gps service
        Geolocator.openLocationSettings();
      }
    } else {
      //denied
      if (permission == LocationPermission.deniedForever) {
        Geolocator.openAppSettings();
        return;
      }
      LocationPermission p = await Geolocator.requestPermission();
      _getCurrentLocation();
    }
    //TODO :Check GPS Service -> Ask to on
    //TODO :Get current Location
  }

  Future<void> _locationPermissionHandler(VoidCallback startService) async {
    /*
    TODO: TOTAL 3 STEPS
    TODO : Check Permission -> Check Permission
    TODO :Check GPS Service -> Ask to on
    TODO :Get current Location
     */

    //TODO : Check Permission -> Check Permission
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      //permission granted

      //TODO :Check GPS Service -> Ask to on
      final bool isEnable = await Geolocator.isLocationServiceEnabled();
      if (isEnable) {
        //Start Provided Service
        startService();
      } else {
        //On gps service
        Geolocator.openLocationSettings();
      }
    } else {
      //denied
      if (permission == LocationPermission.deniedForever) {
        Geolocator.openAppSettings();
        return;
      }
      LocationPermission p = await Geolocator.requestPermission();
      _locationPermissionHandler(startService);
    }
    //TODO :Check GPS Service -> Ask to on
    //TODO :Get current Location
  }
}
