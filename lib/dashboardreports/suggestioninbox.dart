import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SuggestionReport extends StatefulWidget {
  @override
  _SuggestionReportState createState() => _SuggestionReportState();
}

class _SuggestionReportState extends State<SuggestionReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Suggestion Box"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
                  child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('suggestions')
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
                          Text( "User Email : " +
                            document['User Email'],
                            style: TextStyle(
                              color: Colors.blue,
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          SizedBox(height:10),
                          Text( "User Suggestion : " + document['User Suggestion'],
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold, fontSize: 15
                                ),),
                          
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
