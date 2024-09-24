import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_projects/search_screens.dart';
import 'package:http/http.dart' as http;
import 'details_screen.dart';
import 'search_screens.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List movies = [];

  @override
  void initState() {
    super.initState();
    fetchMovies();
  }

  fetchMovies() async {
    final response = await http.get(Uri.parse('https://api.tvmaze.com/search/shows?q=all'));
    if (response.statusCode == 200) {
      setState(() {
        movies = jsonDecode(response.body);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          var movie = movies[index]['show'];
          return ListTile(
            leading: Image.network(movie['image']['medium']),
            title: Text(movie['name']),
            subtitle: Text(movie['summary'] != null
                ? movie['summary'].replaceAll(RegExp('<[^>]*>'), '')
                : 'No summary available'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailsScreen(movie: movie)),
              );
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        ],
        currentIndex: 0, // Set this to current index based on selection
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>SearchScreen()),
            );
          }
        },
      ),
    );
  }
}
