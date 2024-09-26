import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GeoLocatorHomeScreen extends StatefulWidget {
  const GeoLocatorHomeScreen({super.key});

  @override
  State<GeoLocatorHomeScreen> createState() => _GeoLocatorHomeScreenState();
}
//TODO:  to use this package we have to alow some permission to our .xml file

class _GeoLocatorHomeScreenState extends State<GeoLocatorHomeScreen> {
  Position? currentPosition;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Geo-Locator"),
        centerTitle: true,
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Text("Current Location : $currentPosition"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _getCurrenLocation();
        },
        child: const Icon(Icons.location_history),
      ),
    );
  }

  Future<void> _getCurrenLocation() async {
    //TODO: check permission,ask permission
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      //TODO:Check GPS Service,ask to on
      final bool isEnable = await Geolocator.isLocationServiceEnabled();
      if (isEnable) {
        //TODO: Get Current Location
        currentPosition = await Geolocator.getCurrentPosition(
          locationSettings : const LocationSettings(
            accuracy: LocationAccuracy.best,
            distanceFilter: 100,
            timeLimit: Duration(seconds: 30),
          ),
        );

        setState(() {});
      } else {
        // on gps service
        Geolocator.openAppSettings();
      }
    } else {
      if (permission == LocationPermission.deniedForever) {
        Geolocator.openLocationSettings();
        return;
      }
      LocationPermission requestedPermission =
      await Geolocator.requestPermission();
      if (requestedPermission == LocationPermission.always ||
          requestedPermission == LocationPermission.whileInUse) {
        _getCurrenLocation();
      }
    }
  }


}
