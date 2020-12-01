import 'package:cryptconverter/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:cryptconverter/layout.dart';
import 'dart:async';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 2);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
        return HomePage();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Center(
          child: Text(
        "CRYPTCNVRTR",
        style: TextStyle(fontSize: 30, color: Colors.greenAccent[700], fontWeight: FontWeight.bold),
      )),
    );
  }
}
