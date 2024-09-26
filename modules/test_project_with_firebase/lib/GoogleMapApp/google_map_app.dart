import 'package:flutter/material.dart';

import 'google_map_home_screen.dart';

class GoogleMapApp extends StatelessWidget {
  const GoogleMapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Google Map",
      debugShowCheckedModeBanner: true,
      home: GoogleMapHomeScreen(),
    );
  }
}
