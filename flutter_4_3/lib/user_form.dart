import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:io';

class U_form extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Profile Setup';
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  String name = "";
  String gender = "";
  String weight = "";
  String height = "";
  String age = "";

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText:"Name"),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              setState(() {
                name = value;
              });
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText:"Gender"),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              setState(() {
                gender = value;
              });
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText:"Weight"),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              setState(() {
                weight = value;
              });
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText:"Height"),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              setState(() {
                height = value;
              });
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText:"Age"),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              setState(() {
                age = value;
              });
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                _formKey.currentState.validate();
              },
              child: Text('Submit'),
            ),
          ),
          Container (
            child: Text("Name: $name")
          ),
          Container (
            child: Text("Gender: $gender")
          ),
          Container (
            child: Text("Weight: $weight")
          ),
          Container (
            child: Text("Height: $height")
          ),
          Container (
            child: Text("Age: $age")
          ),
        ],
      ),
    );
  }
}