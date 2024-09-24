import 'package:flutter/material.dart';
import 'homescreen.dart'; // Import your HomeScreen
import 'search_screens.dart'; // Import your SearchScreen
import 'details_Screen.dart'; // Import your DetailsScreen
import 'splash_screen.dart'; // Import your SplashScreen (if you have one)

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App', // Title of your app
      theme: ThemeData(
        primarySwatch: Colors.red, // Set the theme colors to match Netflix-style
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(), // Set SplashScreen as the initial screen
      routes: {
        '/home': (context) => HomeScreen(), // Define HomeScreen route
        '/search': (context) => SearchScreen(), // Define SearchScreen route
      },
    );
  }
}


