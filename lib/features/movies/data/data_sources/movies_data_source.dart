abstract class MoviesDataSource {
  Future<Map<String, dynamic>> getNowPlayingMovies(int page);
  Future<Map<String, dynamic>> getPopularMovies(int page);
  Future<Map<String, dynamic>> getTopRatedMovies(int page);
  Future<Map<String, dynamic>> getUpComingMovies(int page);
}
