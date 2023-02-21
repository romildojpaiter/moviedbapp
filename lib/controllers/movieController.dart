import 'package:flutter/material.dart';
import 'package:moviedbapp/models/movies_model.dart';
import 'package:moviedbapp/repositories/movies_repository.dart';

class MovieController {
  final MoviesRepository _moviesRepository;

  MovieController(this._moviesRepository) {
    fetch();
  }

  ValueNotifier<Movies?> movies = ValueNotifier<Movies?>(null);
  Movies? _cachedMovies;

  fetch() async {
    movies.value = await _moviesRepository.getMovies();
    _cachedMovies = movies.value;
  }

  void onChanged(String value) {
    List<Movie> listMovies = _cachedMovies!.listMovies
        .where((element) =>
            element.title.toLowerCase().contains(value.toLowerCase()))
        .toList();
    movies.value = movies.value!.copyWith(listMovies: listMovies);
  }
}
