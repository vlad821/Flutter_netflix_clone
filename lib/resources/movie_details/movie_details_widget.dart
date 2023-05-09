import 'package:flutter/material.dart';

class MovieDetailsWidget extends StatefulWidget {
  final int movieId;
  MovieDetailsWidget({Key? key, required this.movieId}) : super(key: key);

  @override
  _MovieDetailsWidgetState createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Center(
          child: Center(
            child: Text(
              'About film',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.red[800],
              ),
            ),
          ),
        ),
    
),
        body: ListView(children: [
          
        ],),
    );
  }
}
