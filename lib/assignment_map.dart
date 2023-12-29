import 'dart:async';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapAssaignment extends StatefulWidget {
  const MapAssaignment({super.key});

  @override
  State<MapAssaignment> createState() => _MapAssaignmentState();
}

class _MapAssaignmentState extends State<MapAssaignment> {

  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();
  late GoogleMapController googleMapController;
  Location location = Location();
  LocationData? myLocation;
  late StreamSubscription locationSubscription;
  Set<Marker> _markers = {};
  List<LatLng> _polylineCoordinates = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listenToLocation();
  }

  void listenToLocation(){
    locationSubscription = location.onLocationChanged.listen((locationData) {
      myLocation = locationData;
      if(mounted){
        setState(() {

        });
      }
    });
  }

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
        title: Text("Map Assignment"),
      ),
      body: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: CameraPosition(
              target: LatLng(23.420780711231437, 88.8221920955605),
            zoom: 17,),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {
          Marker(
            markerId: MarkerId("Initial Position"),
            position: LatLng(23.42083640234268, 88.8222376141541),
            infoWindow: InfoWindow(
                title: "This is my marker",
                snippet:  "Lat: ${myLocation?.latitude.toString() ??  ""}, Lng: ${myLocation?.longitude.toString() ?? ''}"),
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
            position: LatLng(23.41729997025029, 88.8211299950426),
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
        },
        polylines: {
          Polyline(
              polylineId: PolylineId("This is polyline"),
              color: Colors.blue,
              width: 6,
              points: [
                LatLng(23.42083640234268, 88.8222376141541),
                LatLng(23.41729997025029, 88.8211299950426),
              ])
        },
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    locationSubscription.cancel();
    super.dispose();
  }
}
