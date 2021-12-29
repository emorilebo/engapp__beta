import 'dart:async';

import 'package:engapp__beta/global/global.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  GoogleMapController? newGoogleMapController;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: MyDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          'Welcome to EngApp',
          style: TextStyle(fontSize: 30, fontFamily: 'Lobster'),
        ),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      //   centerTitle: true,
      //   automaticallyImplyLeading: true,
      //   actions: [
      //     IconButton(
      //       onPressed: () {
      //         // Navigator.push(context,
      //         //     MaterialPageRoute(builder: (c) => const MenusUploadScreen()));
      //       },
      //       icon: const Icon(Icons.post_add, color: Colors.white),
      //     ),
      //   ],
      //   flexibleSpace: Container(
      //     decoration: const BoxDecoration(
      //       gradient: LinearGradient(
      //         colors: [
      //           Colors.cyan,
      //           Colors.amber,
      //         ],
      //         begin: FractionalOffset(0.0, 0.0),
      //         end: FractionalOffset(1.0, 0.0),
      //         stops: [0.0, 1.0],
      //         tileMode: TileMode.clamp,
      //       ),
      //     ),
      //   ),
      // ),

      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            myLocationButtonEnabled: true,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controllerGoogleMap.complete(controller);
              newGoogleMapController = controller;
            },
          ),
        ],
      ),
    );
  }
}
