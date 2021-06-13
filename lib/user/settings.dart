import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:toiletfinderapp/intropages/signup.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SafeArea(
          child: Center(
        child: Column(children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 70, 10, 10),
                child: Text(
                  'Notifications',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
              SizedBox(height: 7),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 70, 10, 10),
                child: LiteRollingSwitch(
                  value: true,
                  textOn: 'active',
                  textOff: 'inactive',
                  colorOn: Colors.green,
                  colorOff: Colors.red,
                  iconOn: Icons.done,
                  iconOff: Icons.power_settings_new,
                  onChanged: (bool state) {
                    print('turned ${(state) ? 'on' : 'off'}');
                  },
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 70, 10, 10),
                child: Text(
                  'Delete Account',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
              
              Padding(
                padding: EdgeInsets.fromLTRB(10, 70, 10, 10),
                child: LiteRollingSwitch(
                  value: false,
                  textOn: 'active',
                  textOff: 'inactive',
                  colorOn: Colors.green,
                  colorOff: Colors.red,
                  iconOn: Icons.done,
                  iconOff: Icons.power_settings_new,
                  onChanged: (bool state) {
                    print('turned ${(state) ? 'on' : 'off'}');
                  },
                  onTap: () async {
                      await FirebaseAuth.instance.currentUser.delete();

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUp()));
                  },
                ),
              ),
              
            ],
          ),
          SizedBox(height:30),
          MaterialButton(
            elevation: 10,
                color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Password Reset",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                    onPressed: (){},
              ),
        ]),
      )),
    );
  }
  /*Future<void> deleteAccount() async{
    try {
  await FirebaseAuth.instance.currentUser.delete();
  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SignUp()));
} catch (e) {
   {
    print('The user must reauthenticate before this operation can be executed.');
  }
}
  }*/
}
