import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:toiletfinderapp/dashboardreports/addedtoilets.dart';
import 'package:toiletfinderapp/dashboardreports/addtoilets.dart';
import 'package:toiletfinderapp/dashboardreports/rfreport.dart';
import 'package:toiletfinderapp/dashboardreports/suggestioninbox.dart';
import 'package:toiletfinderapp/intropages/logincheck.dart';


class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.symmetric(
            horizontal: 30,
          ),
          children: <Widget>[
            DrawerHeader(
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: CircleAvatar(
                    radius: 30,
                    child: Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: 30,
                    ),
                    backgroundColor: Colors.blue,
                  )),
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text(
                'Log Out',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              // onTap: signOut,
            ),
          ],
        ),
      ),
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            "TF Dashboard",
          ),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginCheck()));
                  },
                  child: Icon(
                    Icons.logout,
                    size: 26.0,
                  ),
                )),
          ]),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 10,
                      clipBehavior: Clip.antiAlias,
                      color: Colors.blue,
                      child: Column(
                        children: [
                          Center(
                            child: ButtonBar(
                              alignment: MainAxisAlignment.center,
                              children: [
                                MaterialButton(
                                  textColor: Colors.white,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => RfReport()));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 40),
                                    child: Text(
                                      'R & F Report',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 150,
                    width: 150,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 10,
                      clipBehavior: Clip.antiAlias,
                      color: Colors.blue,
                      child: Column(
                        children: [
                          Center(
                            child: ButtonBar(
                              alignment: MainAxisAlignment.center,
                              children: [
                                MaterialButton(
                                  textColor: Colors.white,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AddtoiletReport()));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 50),
                                    child: Text(
                                      'Added Toilets',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 10,
                      clipBehavior: Clip.antiAlias,
                      color: Colors.blue,
                      child: Column(
                        children: [
                          Center(
                            child: ButtonBar(
                              alignment: MainAxisAlignment.center,
                              children: [
                                MaterialButton(
                                  textColor: Colors.white,
                                  onPressed: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 40),
                                    child: Text(
                                      'Registered Complaints',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 150,
                    width: 150,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 10,
                      clipBehavior: Clip.antiAlias,
                      color: Colors.blue,
                      child: Column(
                        children: [
                          Center(
                            child: ButtonBar(
                              alignment: MainAxisAlignment.center,
                              children: [
                                MaterialButton(
                                  textColor: Colors.white,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SuggestionReport()));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 50),
                                    child: Text(
                                      'Suggestion inbox',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 10,
                      clipBehavior: Clip.antiAlias,
                      color: Colors.blue,
                      child: Column(
                        children: [
                          Center(
                            child: ButtonBar(
                              alignment: MainAxisAlignment.center,
                              children: [
                                MaterialButton(
                                  textColor: Colors.white,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Adminaddtoilet()));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 40),
                                    child: Text(
                                      'Add New Toilets',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          child: Icon(Icons.home),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DashboardPage()));
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.blue,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              iconSize: 30.0,
              icon: Icon(Icons.people, color: Colors.white),
              onPressed: () {
                //Navigator.push(context,
                //   MaterialPageRoute(builder: (context) => AboutUs()));
              },
            ),
            IconButton(
              iconSize: 30.0,
              icon: Icon(Icons.chat, color: Colors.white),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DashboardPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
