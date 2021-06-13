import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RfReport extends StatefulWidget {
  @override
  _RfReportState createState() => _RfReportState();
}

class _RfReportState extends State<RfReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("R & F Report"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Rating & Feedback')
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
                          SizedBox(height: 20),
                          Text(
                            "Toilet Name : " + document['Toilet Name'],
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          SizedBox(height:7),
                          Text(
                            "Toilet Landmark : " + document['Toilet Landmark'],
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(height:7),
                          Text(
                            "User Email : " + document['User Email'],
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(height:7),
                          Text(
                            "User Location : " + document['User Location'],
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(height:7),
                          Text(
                            "User Phone : " + document['User Phone'],
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(height:7),
                          Text(
                            "User Rating : " +
                                document['User Rating for Toilet'],
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(height:7),
                          Text(
                            "User State : " + document['User State'],
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(height:7),
                          Text(
                            "User District : " + document['User District'],
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(height:12),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              );
            },
          ),
        ));
  }
}
