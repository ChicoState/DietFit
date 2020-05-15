import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import 'package:flutter_4_3/models/testModel.dart';
import 'package:flutter_4_3/detailPage.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
//import 'package:flutter_
/*
class MytestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(brightness: Brightness.dark),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var futureBuilder = new FutureBuilder<Album>(
      future: RestApiManager().fetchAlbum(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return new Text('loading...');
          default:
            if (snapshot.hasError)
              return new Text('Error: ${snapshot.error}');
            else
              print(snapshot.data.hits[0].recipe.label);
            return createListView(context, snapshot);
        }
      },
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Recipe Page"),
      ),
      body: futureBuilder,
    );
  }


  Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
    return new ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return new Column(
          children: <Widget>[
            new ListTile(
              title: Text(snapshot.data.user.name),
              /*
              leading: Image(
                  image: new CachedNetworkImageProvider(
                      snapshot.data.hits[index].recipe.image)),
              title: new Text(snapshot.data.feed.results[index].artistName),
            */),
            new Divider(
              height: 2.0,
            ),
          ],
        );
      },
    );
  }
}*/

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Membuat List Dari data Internet
  List<Album> listModel = [];
  var loading = false;
  
  Future<Null> getData() async{
    setState(() {
      loading = true;
    });
    
    final responseData = await http.get("https://jsonplaceholder.typicode.com/users");

    if(responseData.statusCode == 200){
      final data = jsonDecode(responseData.body);
      print(data);
      setState(() {
        for(Map i in data){
          listModel.add(Album.fromJson(i));
        }
        loading = false;
      });
    }
  }

  //Panggil Data / Call Data
  @override
  void initState() {
    super.initState();
    getData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text('Home Page List User'),
        centerTitle: true,
      ),

      body: Container(
        child: loading ? Center (child: CircularProgressIndicator()) : ListView.builder(
          itemCount: listModel.length,
            itemBuilder: (context, i){
              final nDataList = listModel[i];
              return Container(
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePageDetail(
                      dName: nDataList.name,
                      dEmail: nDataList.email,
                      dPhone: nDataList.phone,
                      dCity: nDataList.address.city,
                      dZip: nDataList.address.zipcode,
                    )));
                  },
                  child: Card(
                    color: Colors.amber[100],
                    margin: EdgeInsets.all(15),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(nDataList.name, style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.green),
                          ),
                          Text(nDataList.email),
                          Text(nDataList.phone),
                          Text(nDataList.website),

                          SizedBox(height: 10,),
                          Text("Address", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                          Text(nDataList.address.street),
                          Text(nDataList.address.city),
                          Text(nDataList.address.suite),
                          Text(nDataList.address.zipcode),

                          SizedBox(height: 10,),
                          Text("Company", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                          Text(nDataList.company.name),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
        ),
      ),

    );
  }
}