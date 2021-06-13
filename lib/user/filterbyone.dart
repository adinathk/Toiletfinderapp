
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class FilteronePage extends StatefulWidget {
  @override
  _FilteronePageState createState() => _FilteronePageState();
}

class _FilteronePageState extends State<FilteronePage> {

int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Toilets Nearby'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height:10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Filter by :'),
                          SizedBox(height:7),
                          DropdownButton(
              value: _value,
              items: [
                DropdownMenuItem(
                  child: Text("Distance"),
                  value: 1,
                ),
                DropdownMenuItem(
                  onTap: (){
                   /* Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FilterOne()));*/
                  },
                  child: Text("within 1 km"),
                  value: 2,
                ),
                DropdownMenuItem(
                  child: Text("within 2 km"),
                  value: 3
                ),
                DropdownMenuItem(
                    child: Text("within 3 km"),
                    value: 4
                ),
                DropdownMenuItem(
                    child: Text("within 4 km"),
                    value: 4
                ),
                DropdownMenuItem(
                    child: Text("within 5 km"),
                    value: 4
                )
              ],
              onChanged: (value) {
                setState(() {
                  _value = value;
                });
              }),
              SizedBox(height:7),
              Text('Filter by :'),
                          SizedBox(height:7),
                          DropdownButton(
              value: _value,
              items: [
                DropdownMenuItem(
                  child: Text("Rating"),
                  value: 1,
                ),
                DropdownMenuItem(
                  child: Text(" 4-5 stars"),
                  value: 2,
                ),
                DropdownMenuItem(
                  child: Text("3-4 stars"),
                  value: 3
                ),
                DropdownMenuItem(
                    child: Text("2-3 stars"),
                    value: 4
                ),
                DropdownMenuItem(
                    child: Text("1-2 stars"),
                    value: 4
                ),
                DropdownMenuItem(
                    child: Text("0-1 stars"),
                    value: 4
                )
              ],
              onChanged: (value) {
                setState(() {
                  _value = value;
                });
              }),
                        ],
                      ),
                      
                      StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('toiletsnearby')
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Text("no data is added");
              }
              return Container(
                child: Center(
                      child: Column(
                        children: snapshot.data.docs.map((document) {
                          return Column(
                            children: [
                              SizedBox(height: 30),
                              Text("Hotel Name : " +
                                document['Hotel Name'],
                                style: TextStyle(
                                  color: Colors.blue,
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              SizedBox(height: 7),
                              Text("Toilet Rating : " + document['Rating'],
                              style: TextStyle(
                                color: Colors.blue,
                                    fontWeight: FontWeight.bold, fontSize: 15),),
                                    SizedBox(height: 7),
                              Text("Distance from your location : " + document['Distance'],
                              style: TextStyle(
                                color: Colors.blue,
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              
                            ],
                          );
                        }).toList(),
                      ),
                ),
              );
            },
          ),
                    ],
                  ),
        )
    );
  }
  
  
  
}
