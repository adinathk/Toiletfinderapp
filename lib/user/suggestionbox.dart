import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'homepage.dart';

class SuggestionBox extends StatefulWidget {
  @override
  _SuggestionBoxState createState() => _SuggestionBoxState();
}

class _SuggestionBoxState extends State<SuggestionBox> {
  final formKey = GlobalKey<FormState>();
  String email = '';
  TextEditingController sampledata1 = TextEditingController();
  TextEditingController sampledata2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Suggestion Box"),
      ),
      body: SingleChildScrollView(
          child: SafeArea(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                 /* onSaved: (String value) {
                    email = value;
                  },
                  validator: (String value) {
                    Pattern pattern =
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                    RegExp regex = new RegExp(pattern);
                    if (!regex.hasMatch(value))
                      return 'Enter Valid Email';
                    else
                      return null;
                  },*/
                  controller: sampledata1,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      hintText: "Enter your email address"),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  //validator: (String value) {
                  //  if (value.isEmpty) {
                   //   return '*Required';
                   // } else {
                   //   return null;
                   // }
                 // },
                  controller: sampledata2,
                  decoration: InputDecoration(
                      contentPadding: new EdgeInsets.symmetric(
                          vertical: 70.0, horizontal: 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      hintText: "Write your suggestions here"),
                ),
              ),
              SizedBox(height: 20),
              // ignore: missing_required_param
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: MaterialButton(
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Submit Suggestion",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  onPressed: () {
                    //if (formKey.currentState.validate()) {
                    //  formKey.currentState.save();
                   // }
                    Map<String, dynamic> data = {
                      "User Email": sampledata1.text,
                      "User Suggestion": sampledata2.text
                    };
                    FirebaseFirestore.instance
                        .collection("suggestions")
                        .add(data);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
