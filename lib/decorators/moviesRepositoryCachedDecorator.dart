import 'package:moviedbapp/models/movies_model.dart';
import 'package:moviedbapp/repositories/movies_repository.dart';
import 'package:moviedbapp/decorators/moviesRepositoryDecorator.dart';

class MoviesRespositoryCachedDecorator extends MoviesRespositoryDecorator {
  MoviesRespositoryCachedDecorator(MoviesRepository movieRepository)
      : super(movieRepository);

  @override
  Future<Movies> getMovies() async {
    throw await super.getMovies();
  }

  _saveInCache(Movies movies) {}

  Movies _getInCache() {
    return;
  }
}
