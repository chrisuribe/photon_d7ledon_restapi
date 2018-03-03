import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(new MaterialApp(
    home: new FlutterToParticle(),
  ));
}

class FlutterToParticle extends StatefulWidget {
  @override
  FlutterToParticleState createState() => new FlutterToParticleState();
}

class FlutterToParticleState extends State<FlutterToParticle> {

  Map data;

  Future<String> getData() async {


    var response = await http.post(

      // replace with your device id.
      // also update the access token with your own.
        Uri.encodeFull(
            "https://api.particle.io/v1/devices/3f001e001847343438323536/digitalwrite"
        ),
        headers: {
          "Accept": "application/json"
        },
        body: {
          "arg":"D7,HIGH",
          "access_token":"24a5c8b2c5b5bd686d9b64784c831a6ab08b3e93"
        }

    );
    data = JSON.decode(response.body);
    print(data);

    return "Success!";
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new RaisedButton(
          child: new Text("Turn on Photon D7 LED!"),
          onPressed: getData,
        ),
      ),
    );
  }
}
