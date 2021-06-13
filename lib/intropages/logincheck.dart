import 'package:flutter/material.dart';
import 'package:toiletfinderapp/admin/adminlogin.dart';
import 'signin.dart';


class LoginCheck extends StatefulWidget {
  @override
  _LoginCheckState createState() => _LoginCheckState();
}

class _LoginCheckState extends State<LoginCheck> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical:100),
                child: Container(
                    height: 300,
                    width: 250,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 10,
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        children: [
                          SizedBox(height:40),
                          Icon(Icons.person, color: Colors.blue,size: 40,),
                          SizedBox(height: 20,),
                          MaterialButton(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                            color: Colors.blue,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SigninPage()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'User Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                          MaterialButton(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                            color: Colors.blue,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => AdminLogin()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Admin Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                        ],
                      ),
                    )),
              ),
            )),
      ),
    );
  }
}
