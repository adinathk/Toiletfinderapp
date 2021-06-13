
import 'package:flutter/material.dart';
import 'package:toiletfinderapp/admin/adminlogin.dart';
import 'package:toiletfinderapp/admin/adminreal.dart';
import 'package:toiletfinderapp/datetime.dart';
import 'package:toiletfinderapp/intropages/logincheck.dart';
import 'package:toiletfinderapp/intropages/signin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:toiletfinderapp/intropages/splashscreen.dart';
import 'package:toiletfinderapp/user/toiletsnearby.dart';


var routes = <String, WidgetBuilder>{
  "/signin": (BuildContext context) => SigninPage(),
  "/adminsignin": (BuildContext context) => AdminLogin(),
  "/logincheck": (BuildContext context) => LoginCheck(),
};

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primaryColor: Colors.blue, accentColor: Colors.blueAccent),
    home: Splash(),
    routes: routes,
  ));
}


