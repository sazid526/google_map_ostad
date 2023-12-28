import 'dart:async';

import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  Location location = Location();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location Screen'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('My location '),

            ElevatedButton(
              onPressed: () async {
               LocationData currentLocation = await location.getLocation();
                if (mounted) {
                  setState(() {});
                }
              },
              child: Text('Get current location'),
            ),
          ],
        ),
      ),
    );
  }

}