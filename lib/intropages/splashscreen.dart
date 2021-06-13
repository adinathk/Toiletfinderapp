import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:toiletfinderapp/user/homepage.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () => Navigator.pushNamed(context, "/logincheck"));

    if (auth.currentUser != null) {
    print(auth.currentUser.uid);
    Navigator.push(
                    context, MaterialPageRoute(builder: (context) => HomePage()));
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                radius: 50,
                child: Icon(
                  Icons.location_on,
                  color: Colors.white,
                  size: 30,
                ),
                backgroundColor: Colors.blue,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 100),
                child: Text(
                  'Toilet Finder',
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: CircularProgressIndicator(),
              ),
              Text(
                'We Locates Toilets Nearby',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  

}
