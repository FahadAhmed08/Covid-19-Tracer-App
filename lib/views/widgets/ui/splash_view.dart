import 'dart:async';

import 'package:covid_19_app/views/widgets/ui/home_view.dart';
import 'package:flutter/material.dart';

class splash_view extends StatefulWidget {
  const splash_view({super.key});

  @override
  State<splash_view> createState() => _splash_viewState();
}

class _splash_viewState extends State<splash_view> {
  @override
  void initState() {
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => HomeView()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 19, 17, 17),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage("assets/images/abc.jpg"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: SplashScreenText(),
            ),
          ],
        ),
      ),
    );
  }
}

Widget SplashScreenText() {
  return const Align(
    alignment: Alignment.center,
    child: Text(
      "Covid-19\nTracker App",
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 25, color: Colors.white70, fontWeight: FontWeight.w800),
    ),
  );
}
