import 'package:moviedbapp/models/movies_model.dart';
import 'package:moviedbapp/repositories/movies_repository.dart';
import 'package:moviedbapp/utils/api.utils.dart';
import 'package:moviedbapp/utils/dio_service.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final DioService _dioService;

  MoviesRepositoryImpl(this._dioService);
  @override
  Future<Movies> getMovies() async {
    var result = await _dioService.getDio().get(API.RESQUEST_MOVIE_LIST);
    return Movies.fromJson(result.data);
  }
}
