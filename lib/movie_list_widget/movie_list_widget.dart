import 'package:flutter/material.dart';
import 'package:movieapp/resources/resources.dart';

class Movie {
  final int id;
  final String imageName;
  final String title;
  final String time;
  final String description;
  Movie({
     required this.id,
    required this.imageName,
    required this.title,
    required this.time,
    required this.description,
  });
}

class MovieListWidget extends StatefulWidget {
  MovieListWidget({Key? key}) : super(key: key);

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  final _movies = [
    Movie(
      id: 1,
      description: '7/10',
      time: '2022',
      title: 'sib',
      imageName: Images.quietPlace,
    ),
    Movie(
      id: 2,
      description: '7/10',
      time: '2022',
      title: 'Quiet place',
      imageName: Images.quietPlace,
    ),
    Movie(
      id: 3,
      description: '7/10',
      time: '2022',
      title: 'Quiet place',
      imageName: Images.quietPlace,
    ),
    Movie(
      id: 4,
      description: '7/10',
      time: '2022',
      title: 'Euphoria',
      imageName: Images.quietPlace,
    ),
    Movie(
      id: 5,
      description: '7/10',
      time: '2022',
      title: 'Euphoria',
      imageName: Images.quietPlace,
    ),
    Movie(
      id:6,
      description: '7/10',
      time: '2022',
      title: 'Euphoria',
      imageName: Images.quietPlace,
    ),
  ];
  var _filteredMovies = <Movie>[];
  final _searchController = TextEditingController();
  void _searchMovies() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filteredMovies = _movies.where((Movie movie) {
        return movie.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _filteredMovies = _movies;
    }
    setState(() {});
  }

  void _onMovieTap(int index) {
    final id= _movies[index].id;
    Navigator.of(context).pushNamed('/main_screen/movie_details',arguments: id);
  }

  @override
  void initState() {
    super.initState();
    // void _searchMovies() {}
    _filteredMovies = _movies;
    _searchController.addListener(_searchMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Color.fromARGB(255, 35, 4, 2),
            Color.fromARGB(255, 132, 23, 15),
            Colors.red,
            Colors.black
          ],
        ),
      ),
      child: Column(
        children: [
          //   Container(

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Top View',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'See all',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Container(
                height: 500,
                child: ListView.builder(
                  padding: EdgeInsets.only(top: 80),
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  scrollDirection: Axis.horizontal,
                  itemCount: _filteredMovies.length,
                  itemExtent: 250,
                  itemBuilder: (BuildContext context, int index) {
                    final movie = _movies[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 17),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black54.withOpacity(0.2)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.6),
                                  blurRadius: 8,
                                  offset: Offset(0, 9),
                                ),
                              ],
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: Column(
                              children: [
                                Image(image: AssetImage(Images.exampleFilm)),
                                SizedBox(height: 10),
                                Column(
                                  children: [
                                    Text(
                                      movie.title,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          movie.time,
                                          style: TextStyle(
                                            color: Colors.white60,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(width: 30),
                                        Text(
                                          movie.description,
                                          style: TextStyle(
                                            color: Colors.white60,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                        ),
                                      ],
                                    ),
                                    // ElevatedButton(
                                    //   onPressed: () {},
                                    //   style: ButtonStyle(
                                    //     backgroundColor:
                                    //         MaterialStateProperty.all(Colors.black),
                                    //     foregroundColor:
                                    //         MaterialStateProperty.all(Colors.red),
                                    //     textStyle: MaterialStateProperty.all(
                                    //       TextStyle(
                                    //         fontSize: 15,
                                    //         fontWeight: FontWeight.w700,
                                    //       ),
                                    //     ),
                                    //   ),
                                    //   child: Text('Watch now!'),
                                    //),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                                borderRadius: BorderRadius.circular(300),
                                onTap: () => {
                                      _onMovieTap(index),
                                    }),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      labelText: 'Search',
                      filled: true,
                      fillColor: Colors.white.withAlpha(10),
                      border: OutlineInputBorder(),
                    )),
              )
            ],
          ),
        ],
      ),
    );
  }
}
