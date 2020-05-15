import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import 'dart:async';
import 'package:flutter_4_3/models/Recipe.dart';


/*const String apiID ='84415bc1';
const String apiKey = 'c8554d4d925b3172e84c17def6e0b4fe	';
const String apiURL = 'https://api.edamam.com/search?';
const String apiQuery ='chicken';
const String queryString = 'q=$apiQuery';
const String apiIDString = '&app_id=$apiID';
const String apiKeyString = '&app_key=$apiKey';
const String testing = '$apiURL$queryString$apiIDString$apiKeyString';*/

class RestApiManager {
  Future<Album> fetchAlbum() async {
    var url ="https://jsonplaceholder.typicode.com/users";
    // Await the http get response, then decode the json-formatted responce.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      print(jsonResponse);

      final albums = albumFromJson(response.body);

      print(albums);

      return albums;


    } else {
      print("Request failed with status: ${response.statusCode}.");

      return null;
    }
  }
}