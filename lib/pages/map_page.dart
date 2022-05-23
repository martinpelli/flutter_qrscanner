import 'dart:async';

import 'package:flutter/material.dart';

import '../models/scan_model.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Completer<GoogleMapController> _controller = Completer();

  MapType mapType = MapType.normal;

  @override
  Widget build(BuildContext context) {
    final ScanModel scan =
        ModalRoute.of(context)!.settings.arguments as ScanModel;

    Set<Marker> markers = Set<Marker>();
    markers.add(Marker(
        markerId: const MarkerId('geo-location'), position: scan.getLatLng()));

    final CameraPosition initialPoint = CameraPosition(
      target: scan.getLatLng(),
      zoom: 14.4746,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
        actions: [
          IconButton(
              onPressed: () async {
                final GoogleMapController controller = await _controller.future;
                controller.animateCamera(
                    CameraUpdate.newCameraPosition(initialPoint));
              },
              icon: const Icon(Icons.location_on))
        ],
      ),
      body: GoogleMap(
        markers: markers,
        mapType: mapType,
        initialCameraPosition: initialPoint,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (mapType == MapType.normal) {
            mapType = MapType.satellite;
          } else {
            mapType = MapType.none;
          }
          setState(() {});
        },
        child: const Icon(Icons.layers),
      ),
    );
  }
}
