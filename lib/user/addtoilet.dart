import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'homepage.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';


class AddToilet extends StatefulWidget {
  @override
  _AddToiletState createState() => _AddToiletState();
}

class _AddToiletState extends State<AddToilet> {
  final formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController district = TextEditingController();
  TextEditingController yourlocation = TextEditingController();
  TextEditingController toiletname = TextEditingController();
  TextEditingController toiletlandmark = TextEditingController();
  TextEditingController yourrating = TextEditingController();
  TextEditingController description = TextEditingController();

  var _ratingController;
  double _rating;

  double _userRating = 3.0;
  double _initialRating = 2.0;
  bool _isVertical = false;

  IconData _selectedIcon;




  DateTime _currentdate = new DateTime.now();

  Future<Null> _selectdate(BuildContext context) async{
      final DateTime _seldate = await showDatePicker(
        
        context: context,
        initialDate: _currentdate,
        firstDate: DateTime(1990),
        lastDate: DateTime(2030),
        builder: (context,child) {
          return SingleChildScrollView(child: child,);
        }
      );
      if(_seldate!=null) {
        setState(() {
          _currentdate = _seldate;
        });
      }
  }





  @override
  void initState() {
    super.initState();
    _ratingController = TextEditingController(text: '3.0');
    _rating = _initialRating;
  }


  @override
  Widget build(BuildContext context) {

    String _formattedate = new DateFormat.yMMMd().format(_currentdate);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add Toilet"),
      ),
      body: SingleChildScrollView(
          child: SafeArea(
        child: Column(
          children: [

            SizedBox(height: 30),
            IconButton(
              
              onPressed: (){
            _selectdate(context);
          },icon: Icon(Icons.calendar_today),),
          SizedBox(height: 10),

          Center(child: Text('Date: $_formattedate ')),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                /*validator: (String value) {
                  Pattern pattern =
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regex = new RegExp(pattern);
                  if (!regex.hasMatch(value))
                    return 'Enter Valid Email';
                  else
                    return null;
                },*/
                controller: email,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    hintText: "Enter your email address"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
               /* validator: (String value) {
                  if (value.length != 10)
                    return 'Mobile Number must be of 10 digit';
                  else
                    return null;
                },*/
                controller: phone,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    hintText: "Phone"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                /*validator: (String value){
                  if(value.isEmpty){
                    return '*Required';
                  }else{
                    return null;
                  }
                },*/
                controller: state,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    hintText: "State"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                /*validator: (String value){
                  if(value.isEmpty){
                    return '*Required';
                  }else{
                    return null;
                  }
                },*/
                controller: district,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    hintText: "District"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                /*validator: (String value){
                  if(value.isEmpty){
                    return '*Required';
                  }else{
                    return null;
                  }
                },*/
                controller: yourlocation,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    hintText: "Your location"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                /*validator: (String value){
                  if(value.isEmpty){
                    return '*Required';
                  }else{
                    return null;
                  }
                },*/
                controller: toiletname,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    hintText: "Toilet name"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                /*validator: (String value){
                  if(value.isEmpty){
                    return '*Required';
                  }else{
                    return null;
                  }
                },*/
                controller: toiletlandmark,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    hintText: "Toilet Landmark"),
              ),
            ),
           SizedBox(height: 20),
            RatingBarIndicator(
              rating: _userRating,
              itemBuilder: (context, index) => Icon(
                _selectedIcon ?? Icons.star,
                color: Colors.amber,
              ),
              itemCount: 5,
              itemSize: 50.0,
              unratedColor: Colors.amber.withAlpha(50),
              direction: _isVertical ? Axis.vertical : Axis.horizontal,
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
                controller: _ratingController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your rating',
                  labelText: 'Your rating',
                  suffixIcon: MaterialButton(
                    onPressed: () {
                      _userRating =
                          double.parse(_ratingController.text ?? '0.0');
                      setState(() {});
                    },
                    child: Text('Rate'),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: description,
                decoration: InputDecoration(
                    contentPadding: new EdgeInsets.symmetric(
                        vertical: 70.0, horizontal: 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    hintText: "Toilet description"),
              ),
            ),
            SizedBox(height: 20),
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
                   //if (formKey.currentState.validate()) {
                    //  formKey.currentState.save();
                  //  }
                  Map<String, dynamic> data = {
                    "User Email": email.text,
                    "User Phone": phone.text,
                    "User State": state.text,
                    "User District": district.text,
                    "User Location": yourlocation.text,
                    "Toilet Name": toiletname.text,
                    "Toilet Landmark": toiletlandmark.text,
                    "User Rating for Toilet": _ratingController.text,
                    "Toilet Description": description.text,
                    "Date of Entry": _currentdate,
                  };
                  FirebaseFirestore.instance
                      .collection("Add Toilets")
                      .add(data);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}
