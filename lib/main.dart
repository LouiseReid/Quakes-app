import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

void main(List<String> args) async {
  Map _data = await getData();
  List _features = _data["features"];

  runApp(MaterialApp(
      home: Scaffold(
    appBar: AppBar(
      title: Text('Quakes'),
      backgroundColor: Colors.deepOrange[700],
    ),
    body: Padding(
      padding: const EdgeInsets.all(4.0),
      child: ListView.builder(
        itemCount: _features.length,
        itemBuilder: (BuildContext context, int index) {
          DateTime _date = new DateTime.fromMicrosecondsSinceEpoch(
              _features[index]["properties"]["time"] * 1000);
          var _formatted = DateFormat.yMMMd().add_jm().format(_date);
          return Column(
            children: <Widget>[
              Divider(height: 3.0, color: Colors.greenAccent[100]),
              ListTile(
                title: Text(
                  _formatted,
                  style: TextStyle(
                      color: Colors.orange[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
                subtitle: Text(
                  _features[index]["properties"]["place"],
                  style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0),
                ),
                leading: CircleAvatar(
                  radius: 25.0,
                  backgroundColor: _features[index]["properties"]["mag"] < 5.0
                      ? Colors.green
                      : Colors.red,
                  child: Text(_features[index]["properties"]["mag"].toString()),
                ),
              )
            ],
          );
        },
      ),
    ),
  )));
}

Future<Map> getData() async {
  String url =
      'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson';
  http.Response response = await http.get(url);

  return json.decode(response.body);
}
