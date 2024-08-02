import 'package:my_flutter_app/features/movies/data/data_sources/movies_data_source.dart';
import 'package:my_flutter_app/features/movies/domain/models/movies.dart';
import 'package:my_flutter_app/features/movies/domain/repositories/movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  MoviesRepositoryImpl(this._moviesDataSource);
  final MoviesDataSource _moviesDataSource;

  @override
  Future<Movies> getNowPlayingMovies(int page) async {
    var response = await _moviesDataSource.getNowPlayingMovies(page);
    return Movies.fromJson(response);
  }

  @override
  Future<Movies> getPopularMovies(int page) async {
    var response = await _moviesDataSource.getPopularMovies(page);
    return Movies.fromJson(response);
  }

  @override
  Future<Movies> getTopRatedMovies(int page) async {
    var response = await _moviesDataSource.getTopRatedMovies(page);
    return Movies.fromJson(response);
  }

  @override
  Future<Movies> getUpComingMovies(int page) async {
    var response = await _moviesDataSource.getUpComingMovies(page);
    return Movies.fromJson(response);
  }
}
