import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:toiletfinderapp/user/filterbyone.dart';
import 'package:toiletfinderapp/user/ratingsfilter.dart';
import 'package:toiletfinderapp/user/shortest.dart';

class ToiletsNearby extends StatefulWidget {
  @override
  _ToiletsNearbyState createState() => _ToiletsNearbyState();
}

class _ToiletsNearbyState extends State<ToiletsNearby> {
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Toilets Nearby'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Filter by :'),
                  SizedBox(height: 7),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                      child: Text('Shortest Distance',
                      style: TextStyle(color: Colors.black),),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ShortestPage()));
                      }),
                      SizedBox(height: 7,),
                      MaterialButton(
                    shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                      child: Text('Top Rated Toilets',
                      style: TextStyle(color: Colors.black),),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RatingPage()));
                      }),
                ],
              ),
              SizedBox(height: 10),
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('toiletsnearby')
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Text("no data is added");
                  }
                  return Container(
                    child: Center(
                      child: Column(
                        children: snapshot.data.docs.map((document) {
                          return Column(
                            children: [
                              SizedBox(height: 30),
                              Text(
                                "Hotel Name : " + document['Hotel Name'],
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                              SizedBox(height: 7),
                              Text(
                                "Toilet Rating : " + document['Rating'],
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                              SizedBox(height: 7),
                              Text(
                                "Distance from your location : " +
                                    document['Distance'],
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
