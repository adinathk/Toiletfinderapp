import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:toiletfinderapp/admin/admindashboard.dart';

class AdminLoginReal extends StatefulWidget {
  @override
  _AdminLoginRealState createState() => _AdminLoginRealState();
}

class _AdminLoginRealState extends State<AdminLoginReal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin loading'),),
      body: SingleChildScrollView(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('users')
                .where("role",isEqualTo: "admin" )
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                return DashboardPage();
              }
              return DashboardPage();
            },
          ),
        )
    );
  }
}