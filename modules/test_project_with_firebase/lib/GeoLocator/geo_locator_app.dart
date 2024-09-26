import 'package:flutter/material.dart';

import 'geo_locator_home_screen.dart';

class GeoLocatorApp extends StatelessWidget {
  const GeoLocatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Google Map",
      debugShowCheckedModeBanner: true,
      home: GeoLocatorHomeScreen(),
    );
  }
}
