import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main(List<String> args) async{
  Map _data = await getData();
  List _features =_data["features"];

  print(_features);
  
  runApp(MaterialApp(
    home:Scaffold(
      appBar:AppBar(
        title: Text('Quakes'),
        backgroundColor: Colors.deepOrange[700],
      ),
      body: ListView(

      ),
    )
  ));
}

Future<Map>getData() async{
String url = 'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson';
http.Response response = await http.get(url);

return json.decode(response.body);
}