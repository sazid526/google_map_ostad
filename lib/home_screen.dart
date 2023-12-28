import 'dart:async';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  late GoogleMapController googleMapController;
  Location location = Location();

  Future<void> getCurrentLocation() async {
    final LocationData locationData = await location.getLocation();

    googleMapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(locationData.latitude!, locationData.longitude!),
        zoom: 17)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google Maps"),
      ),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
            target: LatLng(23.427580326810077, 88.82347522459632),
            zoom: 17,
            bearing: 0,
            tilt: 5),
        onLongPress: (LatLng Latling) {
          print("On Long Press on $Latling");
        },
        onCameraMove: (cameraPosition) {
          print(cameraPosition);
        },
        zoomControlsEnabled: false,
        zoomGesturesEnabled: false,
        compassEnabled: false,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        markers: {
          Marker(
            markerId: MarkerId("Initial Position"),
            position: LatLng(23.427580326810077, 88.82347522459632),
            infoWindow: InfoWindow(
                title: "This is my marker", snippet: "This is my snippet"),
            draggable: true,
            onDrag: (LatLng position) {
              print(position);
            },
            onDragEnd: (LatLng position) {
              print(position);
            },
            onDragStart: (LatLng position) {
              print(position);
            },
          ),
          Marker(
            markerId: MarkerId("Initial Position"),
            position: LatLng(23.42868011524524, 88.82574263960123),
            infoWindow: InfoWindow(
                title: "This is my marker", snippet: "This is my snippet"),
            draggable: true,
            onDrag: (LatLng position) {
              print(position);
            },
            onDragEnd: (LatLng position) {
              print(position);
            },
            onDragStart: (LatLng position) {
              print(position);
            },
          ),
          Marker(
            markerId: MarkerId("Initial Position"),
            position: LatLng(23.430099840959297, 88.82391337305307),
            infoWindow: InfoWindow(
                title: "This is my marker", snippet: "This is my snippet"),
            draggable: true,
            onDrag: (LatLng position) {
              print(position);
            },
            onDragEnd: (LatLng position) {
              print(position);
            },
            onDragStart: (LatLng position) {
              print(position);
            },
          )
        },
        polylines: {
          Polyline(
              polylineId: PolylineId("This is polyline"),
              color: Colors.red,
              width: 6,
              points: [
                LatLng(23.427580326810077, 88.82347522459632),
                LatLng(23.42868011524524, 88.82574263960123),
                LatLng(23.430099840959297, 88.82391337305307),
                LatLng(23.427580326810077, 88.82347522459632),
              ])
        },
      ),
    );
  }
}
