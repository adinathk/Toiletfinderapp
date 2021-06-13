import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'admindashboard.dart';

class AdminLogin extends StatefulWidget {
  @override
  _AdminLoginState createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: SafeArea(
        child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical:90),
              child: Container(
          height: 350,
          width: 300,
          child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 10,
                clipBehavior: Clip.antiAlias,
                child: Column(children: [
                  SizedBox(height: 30),
                  Text("Admin Login",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.blue),),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextFormField(
                        onChanged: (value) {
                          email = value;
                        },
                        style: TextStyle(color: Colors.black, fontSize: 16.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                          hintText: "Admin Email",
                          hintStyle:
                              TextStyle(color: Colors.black, fontSize: 16.0),
                        )),
                  ),
                  SizedBox(height: 15.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextFormField(
                        onChanged: (value) {
                          password = value;
                        },
                        style: TextStyle(color: Colors.black, fontSize: 16.0),
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                          hintText: "Admin Password",
                          hintStyle:
                              TextStyle(color: Colors.black, fontSize: 16.0),
                        )),
                  ),
                  SizedBox(height: 30.0),
                  MaterialButton(
                    onPressed: () async {
                      setState(() {
                        showSpinner = true;
                      });
                      try {
                        final user = await _auth.signInWithEmailAndPassword(
                            email: email, password: password);
                        if (user != null) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DashboardPage()));
                        }
                        setState(() {
                          showSpinner = false;
                        });
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    color: Colors.blue,
                  ),
                ])),
        ),
            )),
      ),
    )));
  }
}
