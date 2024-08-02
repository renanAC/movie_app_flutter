import 'package:my_flutter_app/features/movies/data/data_sources/movies_data_source.dart';
import 'package:my_flutter_app/infrastructure/api/api_rest.dart';

class MoviesDataSourceImpl implements MoviesDataSource {
  MoviesDataSourceImpl(this._apiRest);
  final ApiRest _apiRest;

  final String _nowPlayingMoviesEndPoint = 'movie/now_playing';
  final String _nowPopularEndPoint = 'movie/popular';
  final String _nowTopRetedEndPoint = 'movie/top_rated';
  final String _nowUpComingEndPoint = 'movie/upcoming';

  @override
  Future<Map<String, dynamic>> getNowPlayingMovies(int page) async =>
      await _apiRest
          .get(_nowPlayingMoviesEndPoint, queryParameters: {'page': page});

  @override
  Future<Map<String, dynamic>> getPopularMovies(int page) async =>
      await _apiRest.get(_nowPopularEndPoint, queryParameters: {'page': page});

  @override
  Future<Map<String, dynamic>> getTopRatedMovies(int page) async =>
      await _apiRest.get(_nowTopRetedEndPoint, queryParameters: {'page': page});

  @override
  Future<Map<String, dynamic>> getUpComingMovies(int page) async =>
      await _apiRest.get(_nowUpComingEndPoint, queryParameters: {'page': page});
}
