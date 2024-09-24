import 'package:flutter/material.dart';
import 'package:flutter_application_projects/homescreen.dart';
//import 'package:your_app/home_screen.dart'; // Import home screen for navigation

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network('assets/neflix.webp', // Add a local image
            fit: BoxFit.cover),
      ),
    );
  }
}

// In main.dart, navigate to HomeScreen after a delay
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
     Navigator.pushReplacement(
         context, MaterialPageRoute(builder: (context) => HomeScreen())
           );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}
