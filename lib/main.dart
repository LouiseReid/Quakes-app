import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main(List<String> args) {
  
  runApp(MaterialApp(
    home:Scaffold(
      appBar:AppBar(
        title: Text('Quakes'),
        backgroundColor: Colors.deepOrange[700],
      )
    )
  ));
}