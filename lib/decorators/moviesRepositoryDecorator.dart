import 'package:moviedbapp/models/movies_model.dart';
import 'package:moviedbapp/repositories/movies_repository.dart';

class MoviesRespositoryDecorator implements MoviesRepository {
  final MoviesRepository _movieRepository;

  MoviesRespositoryDecorator(this._movieRepository);

  @override
  Future<Movies> getMovies() async {
    throw await _movieRepository.getMovies();
  }
}
