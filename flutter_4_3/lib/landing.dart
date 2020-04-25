import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:io';
import 'main.dart';

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: MainMenu(),
    );
  }
}

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bamboo'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              alignment: Alignment(0.0, 1.0),
              padding: EdgeInsets.all(30.0),
              child: Text('Start your journey with us', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, letterSpacing: 2.0))
            ),
            Container(
              padding: EdgeInsets.all(30.0),
              child: Image.asset('assets/food.jpg')
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                Container(
                  height: 100,
                  width: 200,
                  padding: EdgeInsets.all(10.0),
                  child:RaisedButton(
                    child:Text('Create Acount', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, letterSpacing: 2.0)),
                    color: Colors.green,
                    padding: EdgeInsets.all(10.0),
                    onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>ImageCapture()));
                    }
                  )
                ),
                Container(
                  height: 100,
                  width: 200,
                  padding: EdgeInsets.all(10.0),
                  child:RaisedButton(
                    child:Text('Sign In', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, letterSpacing: 2.0)),
                    color: Colors.green,
                    padding: EdgeInsets.all(10.0),
                    onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>ImageCapture()));
                    }
                  )
                )
              ])
            )
          ]
        )

    )
    );
  }
}