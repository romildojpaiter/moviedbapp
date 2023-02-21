import 'package:flutter/material.dart';
import 'package:moviedbapp/models/movies_model.dart';
import 'package:moviedbapp/widgets/listMovieWidget.dart';

class DetailPage extends StatelessWidget {
  final Movie movie;
  const DetailPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: ListMoviesWidget(movie: movie),
    );
  }
}
