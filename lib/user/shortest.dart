
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:toiletfinderapp/user/ratingsfilter.dart';


class ShortestPage extends StatefulWidget {
  @override
  _ShortestPageState createState() => _ShortestPageState();
}

class _ShortestPageState extends State<ShortestPage> {

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
                      SizedBox(height:10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Filtered by :'),
                          SizedBox(height:7),
                         Text('Near to the Farthest',
                          style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                          MaterialButton(
                    shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                      child: Text('Rating',
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
                      SizedBox(height:10),
                      
                      StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('toiletsnearby')
                .orderBy("Distance")
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                              Text("Hotel Name : " +
                                document['Hotel Name'],
                                style: TextStyle(
                                  color: Colors.blue,
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              SizedBox(height: 7),
                              Text("Toilet Rating : " + document['Rating'],
                              style: TextStyle(
                                color: Colors.blue,
                                    fontWeight: FontWeight.bold, fontSize: 15),),
                                    SizedBox(height: 7),
                              Text("Distance from your location : " + document['Distance'],
                              style: TextStyle(
                                color: Colors.blue,
                                    fontWeight: FontWeight.bold, fontSize: 15),
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
        )
    );
  }
  
  
  
}
