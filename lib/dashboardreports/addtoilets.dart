import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Adminaddtoilet extends StatefulWidget {
  @override
  _AdminaddtoiletState createState() => _AdminaddtoiletState();
}

class _AdminaddtoiletState extends State<Adminaddtoilet> {
  final formKey = GlobalKey<FormState>();
  String email = '';
  TextEditingController sampledata1 = TextEditingController();
  TextEditingController sampledata2 = TextEditingController();
  TextEditingController sampledata3 = TextEditingController();
  TextEditingController sampledata4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add Toilet"),
      ),
      body: SingleChildScrollView(
          child: SafeArea(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  validator: (String value) {
                    if (value.isEmpty) {
                      return '*Required';
                    } else {
                      return null;
                    }
                  },
                  controller: sampledata1,
                  decoration: InputDecoration(
                      contentPadding: new EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      hintText: "Toilet Name"),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  validator: (String value) {
                    if (value.isEmpty) {
                      return '*Required';
                    } else {
                      return null;
                    }
                  },
                  controller: sampledata2,
                  decoration: InputDecoration(
                      contentPadding: new EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      hintText: "Toilet Ratings"),
                ),
              ),
              SizedBox(height: 20),
                  Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  validator: (String value) {
                    if (value.isEmpty) {
                      return '*Required';
                    } else {
                      return null;
                    }
                  },
                  controller: sampledata3,
                  decoration: InputDecoration(
                      contentPadding: new EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      hintText: "cordinates"),
                ),
              ),
              SizedBox(height:20),
              // ignore: missing_required_param
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: MaterialButton(
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Add Toilet",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      formKey.currentState.save();
                    }
                    Map<String, dynamic> data = {
                      "Hotel Name": sampledata1.text,
                      "Rating": sampledata2.text,
                      "cordinates": [sampledata3.text,sampledata4.text],
                      
                    };
                    FirebaseFirestore.instance
                        .collection("markers")
                        .add(data);
                    //Navigator.push(context,
                       // MaterialPageRoute(builder: (context) => HomePage()));
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


