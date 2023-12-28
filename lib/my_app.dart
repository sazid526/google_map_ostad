import 'package:flutter/material.dart';
import 'package:google_map_ostad/home_screen.dart';
import 'package:google_map_ostad/location.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LocationScreen(),
    );
  }
}