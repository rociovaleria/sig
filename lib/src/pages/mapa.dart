import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
export 'package:sos/src/pages/mapa.dart';

class MapsSample extends StatefulWidget {
  @override
  _MapsSampleState createState() => _MapsSampleState();
}

class _MapsSampleState extends State<MapsSample> {

  final Set<Marker> _markers = Set();
  final double _zoom = 10;
  CameraPosition _initialPosition = CameraPosition(target: LatLng(26.8206, 30.8025));
  MapType _defaultMapType = MapType.normal;
  Completer<GoogleMapController> _controller = Completer();


  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  void _changeMapType() {
    setState(() {
      _defaultMapType = _defaultMapType == MapType.normal ? MapType.satellite : MapType.normal;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('APOYO U Map'),
          centerTitle: true,
        ),
        drawer: _drawer(),
        body: Stack(
          children: <Widget>[
            GoogleMap(
              markers: _markers,
              mapType: _defaultMapType,
              myLocationEnabled: true,
              onMapCreated: _onMapCreated,
              initialCameraPosition: _initialPosition,
            ),
            Container(
              margin: EdgeInsets.only(top: 80, right: 10),
              alignment: Alignment.topRight,
              child: Column(
                children: <Widget>[
                  FloatingActionButton(
                      child: Icon(Icons.layers),
                      elevation: 5,
                      backgroundColor: Colors.teal[200],
                      onPressed: () {
                        _changeMapType();
                        print('Changing the Map Type');
                      }),
                ],
              ),
            ),

          ],
        ),
    );
  }

  Widget _drawer(){
    return Drawer(
      elevation: 16.0,
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Login with:"),
            accountEmail: Text("elvingAguilar@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, size: 60.0),
            ),
            otherAccountsPictures: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.location_searching),
              )
            ],
          ),
          ListTile(
            title: new Text("ListEmergency"),
            leading: new Icon(Icons.security),
          ),
          Divider(),
          ListTile(
            onTap: (){
              _goToNewYork();
              Navigator.of(context).pop();
            },
            title: new Text("Policia"),
            trailing: new Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            onTap: (){
              _goToNewDelhi();
              Navigator.of(context).pop();
            },
            title: new Text("Bolberos"),
            trailing: new Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            onTap: (){
              _goToLondon();
              Navigator.of(context).pop();
            },
            title: new Text("Ambulancia"),
            trailing: new Icon(Icons.arrow_forward_ios),
          ),
          /*
          ListTile(
            onTap: (){
              _goToTokyo();
              Navigator.of(context).pop();
            },
            title: new Text("Tokyo"),
            trailing: new Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            onTap: (){
              _goToDubai();
              Navigator.of(context).pop();
            },
            title: new Text("Dubai"),
            trailing: new Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            onTap: (){
              _goToParis();
              Navigator.of(context).pop();
            },
            title: new Text("Paris"),
            trailing: new Icon(Icons.arrow_forward_ios),
          )
          */
        ],
      ),
    );
  }


  Future<void> _goToNewYork() async {
    double lat = -17.77625451635678;
    double long = -63.19510474642641;
    GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, long), _zoom));
    setState(() {
      _markers.clear();
      _markers.add(
        Marker(
            markerId: MarkerId('newyork'),
            position: LatLng(lat, long),
            infoWindow: InfoWindow(title: 'Policia', snippet: 'solicita policia')
        ),
      );
    });
  }

  Future<void> _goToNewDelhi() async {
    double lat = -17.77625451635678;
    double long = -63.19510474642641;
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, long), _zoom));
    setState(() {
      _markers.clear();
      _markers.add(
        Marker(
            markerId: MarkerId('newdelhi'),
            position: LatLng(lat, long),
            infoWindow: InfoWindow(title: 'Bombero',  snippet: 'solicita Bombero')),
      );
    });
  }

  Future<void> _goToLondon() async {
    double lat = -17.77625451635678;
    double long = -63.19510474642641;
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, long), _zoom));
    setState(() {
      _markers.clear();
      _markers.add(
        Marker(
            markerId: MarkerId('london'),
            position: LatLng(lat, long),
            infoWindow: InfoWindow(title: 'Ambulancia',  snippet: 'solicia Ambulancia')),
      );
    });
  }
  
/*
  Future<void> _goToTokyo() async {
    double lat = 35.6795;
    double long = 139.77171;
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, long), _zoom));
    setState(() {
      _markers.clear();
      _markers.add(
        Marker(
            markerId: MarkerId('tokyo'),
            position: LatLng(lat, long),
            infoWindow: InfoWindow(title: 'Tokyo',  snippet: 'Welcome to Tokyo')),
      );
    });
  }
  */
/*
  Future<void> _goToDubai() async {
    double lat = 25.2048;
    double long =55.2708;
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, long), _zoom));
    setState(() {
      _markers.clear();
      _markers.add(
        Marker(
            markerId: MarkerId('dubai'),
            position: LatLng(lat, long),
            infoWindow: InfoWindow(title: 'Dubai',  snippet: 'Welcome to Dubai')),
      );
    });
  }
  */
  /*
  Future<void> _goToParis() async {
    double lat = 48.8566;
    double long = 2.3522;
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, long), _zoom));
    setState(() {
      _markers.clear();
      _markers.add(
        Marker(
            markerId: MarkerId('paris'),
            position: LatLng(lat, long),
            infoWindow: InfoWindow(title: 'Paris',  snippet: 'Welcome to Paris')),
      );
    });
  }
  */
}