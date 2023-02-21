import 'dart:convert';

import 'package:moviedbapp/models/movies_model.dart';
import 'package:moviedbapp/repositories/movies_repository.dart';
import 'package:moviedbapp/decorators/moviesRepositoryDecorator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoviesRespositoryCachedDecorator extends MoviesRespositoryDecorator {
  final String _key = 'movies_cache';

  MoviesRespositoryCachedDecorator(MoviesRepository movieRepository)
      : super(movieRepository);

  @override
  Future<Movies> getMovies() async {
    try {
      Movies movies = await super.getMovies();
      _saveInCache(movies);
      return movies;
    } catch (e) {
      print(e);
      return await _getInCache();
    }
  }

  _saveInCache(Movies movies) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(_key, jsonEncode(movies.toJson()));
  }

  Future<Movies> _getInCache() async {
    var prefs = await SharedPreferences.getInstance();
    var moviesMap = jsonDecode(prefs.getString(_key)!);
    print('Recuperou do Shared Preferrence');
    print('$moviesMap');
    return Movies.fromJson(moviesMap);
  }
}
