import 'package:my_flutter_app/features/movies/domain/models/movies.dart';

abstract class MoviesRepository {
  Future<Movies> getNowPlayingMovies(int page);
  Future<Movies> getPopularMovies(int page);
  Future<Movies> getTopRatedMovies(int page);
  Future<Movies> getUpComingMovies(int page);
}
