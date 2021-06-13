import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:toiletfinderapp/user/toiletsnearby.dart';

/*Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      home: MapLocation(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MapLocation extends StatefulWidget {
  @override
  _MapLocationState createState() => _MapLocationState();
}

class _MapLocationState extends State<MapLocation> {
  List<Marker> allMarker = [];

  @override
  void initState() {
    super.initState();
    loadMaps();
  }

  Widget loadMaps() {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('markers').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Text("loading map please wait");
          }
          for (int i = 0; i < snapshot.data.docs.length; i++) {
            allMarker.add(Marker(
              markerId: MarkerId('myMarker'),
              infoWindow: InfoWindow(
                  title: 'TFmarkers',
                  snippet: snapshot.data.docs[i]['Hotel Name']),
              onTap: () {
                print(snapshot.data.docs[i]['Hotel Name']);
              },
              position: LatLng(snapshot.data.docs[i]['cordinates'].latitude,
                  snapshot.data.docs[i]['cordinates'].longitude),
            ));
          }
          return Center(
            child: Container(
              child: GoogleMap(
                markers: Set.from(allMarker),
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                initialCameraPosition: CameraPosition(
                    target: LatLng(11.0540, 75.8555), zoom: 15.0),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maps'),
      ),
      body: loadMaps(),
    );
  }
}*/

class MapLocationPage extends StatefulWidget {
  @override
  _MapLocationPageState createState() => _MapLocationPageState();
}

class _MapLocationPageState extends State<MapLocationPage> {
  List<Marker> allMarker = [];
  bool mapToggle = false;
  bool clientsToggle = false;
  var currentLocation;
  GoogleMapController mapController;
  var filterDist;

  @override
  void initState() {
    super.initState();
    Geolocator.getCurrentPosition().then((currloc) {
      setState(() {
        currentLocation = currloc;
        mapToggle = true;
      });
    });
  }

  //filtermarker based on distance

  /*filterMarkers(dist){
    for(int i=0; i< allMarker.length; ++i){
      Geolocator.distanceBetween(currentLocation.latitude, currentLocation.longitude, 11.0549,75.89).
    }
  }*/

  Widget loadMaps() {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('markers').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Text("loading map please wait");
          }
          for (int i = 0; i < snapshot.data.docs.length; i++) {
            allMarker.add(Marker(
              markerId: MarkerId('myMarker'),
              infoWindow: InfoWindow(
                title: 'TF marker',
                snippet: snapshot.data.docs[i]['Hotel Name'],
              ),
              onTap: () {
                print(snapshot.data.docs[i]['Hotel Name']);
              },
              position: LatLng(snapshot.data.docs[i]['cordinates'].latitude,
                  snapshot.data.docs[i]['cordinates'].longitude),
            ));
          }
          return Center(
            child: Container(
                child: mapToggle
                    ? GoogleMap(
                        markers: Set.from(allMarker),
                        myLocationEnabled: true,
                        myLocationButtonEnabled: true,
                        onMapCreated: onMapCreated,
                        initialCameraPosition: CameraPosition(
                            target: LatLng(currentLocation.latitude,
                                currentLocation.longitude),
                            zoom: 15.0),
                      )
                    : Center(
                        child: Text("Loading map please wait"),
                      )),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Map"),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: (){
              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ToiletsNearby()));
            },
          )
        ],
      ),
      body: loadMaps(),
    );
  }

  void onMapCreated(controller) {
    setState(() {
      mapController = controller;
    });
  }

  /* Future<bool> getDist(){
    return showDialog(context: context, 
    barrierDismissible: true,
    builder: (context){
      return AlertDialog(
        title: Text('Enter the distance'),
        contentPadding: EdgeInsets.all(10),
        content: TextField(
          decoration: InputDecoration(hintText:'Enter Distance'),
          onChanged: (val){
            setState(() {
              filterDist = val;
            });
          },
        ),
        actions: [
          MaterialButton(
            child: Text('OK'),
            color:Colors.transparent,
            textColor:Colors.blue,
            onPressed:(){
              filterMarkers(filterDist);
              Navigator.of(context).pop();
            }
          )
        ],
      );
    });
  }*/

}
