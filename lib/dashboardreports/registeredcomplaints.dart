import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterComplaint extends StatefulWidget {
  @override
  _RegisterComplaintState createState() => _RegisterComplaintState();
}

class _RegisterComplaintState extends State<RegisterComplaint> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Complaint messages"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
                  child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('complaintmsg')
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
                          Text( "complaint message : " +
                            document['complaintmsg'],
                            style: TextStyle(
                              color: Colors.blue,
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          SizedBox(height:10),
                          
                          
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
