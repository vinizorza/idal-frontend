import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
      home: Scaffold(
        body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Icon(
                  Icons.account_balance,
                  color: Colors.indigo,
                  size: 120.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Senha',
                    ),
                  ),
                ),
                RaisedButton(
                  color: Colors.indigo,
                  textColor: Colors.white,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.all(12.0),
                  splashColor: Colors.blueAccent,
                  onPressed: getData,
                  child: Text("Login", style: TextStyle(fontSize: 20.0)),
                )
              ],
            )
        ),
      )));
}

List data;

Future<String> getData() async {
  var response = await http.get(
      Uri.encodeFull("https://jsonplaceholder.typicode.com/posts"),
      headers: {
        "Accept": "application/json"
      }
  );
  data = json.decode(response.body);
  print(data[1]["title"]);

  return "Success!";
}