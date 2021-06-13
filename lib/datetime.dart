import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class DateTimePicker extends StatefulWidget {
  @override
  _DateTimePickerState createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {

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
  Widget build(BuildContext context) {
    String _formattedate = new DateFormat.yMMMd().format(_currentdate);
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Date'),
        actions: <Widget>[
          IconButton(onPressed: (){
            _selectdate(context);
          },icon: Icon(Icons.calendar_today),)
        ],
      ),
      body: Center(child: Text('Date: $_formattedate ')),
    );


  }
}