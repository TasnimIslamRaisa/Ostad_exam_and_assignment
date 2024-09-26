import 'package:flutter/material.dart';

class GeoLocatorHomeScreen extends StatefulWidget {
  const GeoLocatorHomeScreen({super.key});

  @override
  State<GeoLocatorHomeScreen> createState() => _GeoLocatorHomeScreenState();
}

class _GeoLocatorHomeScreenState extends State<GeoLocatorHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Geo-Locator"),
        centerTitle: true,
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text("Current Location"),
      ),
    );
  }
}
