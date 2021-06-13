import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:toiletfinderapp/intropages/signin.dart';
import 'package:toiletfinderapp/user/aboutus.dart';
import 'package:toiletfinderapp/user/addtoilet.dart';
import 'package:toiletfinderapp/user/chatscreen.dart';
import 'package:toiletfinderapp/user/ratefeedback.dart';
import 'package:toiletfinderapp/user/settings.dart';
import 'package:toiletfinderapp/user/suggestionbox.dart';
import 'package:url_launcher/url_launcher.dart';
import 'maps.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                'About Us',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutUs()));
              },
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text(
                'Suggestion Box',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SuggestionBox()));
              },
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
               onTap: () async{
                 await FirebaseAuth.instance.signOut();
                 Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SigninPage()));
               },
            ),
            SizedBox(height: 10),
            Divider(
              thickness: 1,
              color: Colors.blue,
              indent: 10,
              height: 10,
            ),
            SizedBox(height: 10),
            Text(
              'Toilet Finder',
              style: TextStyle(
                fontSize: 15,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              'Developed by - ToiletFinder Inc',
              style: TextStyle(
                fontSize: 15,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              'Version: v1.0',
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
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Toilet Finder",
          ),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    SnackBar(
                      content: Row(
                        children: [
                          Expanded(child: Text("No new notification")),
                          SizedBox(
                            height: 20,
                          ),
                          Icon(Icons.thumb_up),
                        ],
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.blue,
                      content: Row(
                        children: [
                          Expanded(
                              child: Text(
                            "No new notification",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          )),
                          SizedBox(
                            height: 20,
                          ),
                          Icon(
                            Icons.thumb_up,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ));
                  },
                  child: Icon(
                    Icons.notifications_active,
                    size: 26.0,
                  ),
                )),
          ]),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              MaterialButton(
                elevation: 10,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MapLocationPage()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Search Toilets",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                color: Colors.blue,
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 130,
                    width: 130,
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
                                                RateFeedback()));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 35),
                                    child: Text(
                                      'Rating & Feedback',
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
                    height: 130,
                    width: 130,
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
                                            builder: (context) => AddToilet()));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 35),
                                    child: Text(
                                      'Add Toilets',
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
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 130,
                    width: 130,
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
                                                SettingsPage()));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 35),
                                    child: Text(
                                      'Settings',
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
                    height: 130,
                    width: 130,
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
                                                ChatScreen()));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 35),
                                    child: Text(
                                      'Register Complaints',
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
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 130,
                    width: 130,
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
                                  onPressed: sbmSite,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 35),
                                    child: Text(
                                      'SBM Portal',
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
                    height: 130,
                    width: 130,
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
                                                SuggestionBox()));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 35),
                                    child: Text(
                                      'Suggestion Box',
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
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          child: Icon(Icons.home),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutUs()));
              },
            ),
            IconButton(
              iconSize: 30.0,
              icon: Icon(Icons.chat, color: Colors.white),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> sbmSite() async {
    const url = 'https://swachhbharatmission.gov.in/sbmcms/index.html';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
