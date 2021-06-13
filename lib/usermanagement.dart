
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:toiletfinderapp/admin/admindashboard.dart';
import 'package:toiletfinderapp/intropages/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';


 User user = FirebaseAuth.instance.currentUser;

class UserManagement{
  Widget handleAuth(){
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')  
            .doc(user.uid)
            .snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasData) {
            return checkRole(snapshot.data);
          }
          return CircularProgressIndicator();
        },
      );
  }

  checkRole(DocumentSnapshot snapshot) {
    if (snapshot.data == null) {
      return Center(
        child: Text('no data set in the userId document in firestore'),
      );
    }
    if (snapshot.data()['role'] == 'admin') {
      return DashboardPage();
    } else {
      return SigninPage();
    }
  }
  }

  /*if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else */