import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:io';

class A_form extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Create Account';
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
  String username = "";
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText:"Username"),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              setState(() {
                username = value;
              });
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText:"Email"),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              setState(() {
                email = value;
              });
              return null;
            },
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(labelText:"Password"),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              setState(() {
                password = value;
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
            child: Text("Username: $username")
          ),
          Container (
            child: Text("Email: $email")
          ),
          Container (
            child: Text("password: $password")
          ),
        ],
      ),
    );
  }
}