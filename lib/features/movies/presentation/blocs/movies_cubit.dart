import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_app/features/movies/domain/models/movies.dart';
import 'package:my_flutter_app/infrastructure/base/use_case_base.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit(this._useCaseMovies) : super(MoviesIddleState());
  final UseCaseBase<Movies, int> _useCaseMovies;

  int? _totalPage;
  int _currentPage = 0;
  List<Movie> _movies = [];

  Future<void> getMovies() async {
    emit(MoviesLoadingState());
    var responseMovies = await _useCaseMovies.call(1);
    responseMovies.fold(
      (_) => emit(MoviesErrorState()),
      _setSuccessState,
    );
  }

  Future<void> loadMoreMovies() async {
    if (state is MoviesSuccessState) {
      _loadMoreMovieStateSucess();
    }
  }

  Future<void> _loadMoreMovieStateSucess() async {
    if (!_isLastPage) {
      var responseMovies = await _useCaseMovies.call(_nextPage);

      responseMovies.fold(
        (_) => {},
        _setSuccessState,
      );
    }
  }

  void _setSuccessState(Success<Movies> success) {
    emit(MoviesLoadingMore());
    _updatePagesPosition(success.result);
    _movies.addAll(success.result.results);
    emit(MoviesSuccessState(movies: _movies));
  }

  void _updatePagesPosition(Movies movies) {
    _totalPage = movies.totalPages;
    _currentPage = movies.page;
  }

  int get _nextPage => _currentPage + 1;

  bool get _isLastPage => _totalPage == _currentPage;
}


class MoviesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MoviesIddleState extends MoviesState {}

class MoviesLoadingState extends MoviesState {}

class MoviesLoadingMore extends MoviesState {}

class MoviesErrorState extends MoviesState {}

class MoviesSuccessState extends MoviesState {
  MoviesSuccessState({required this.movies});

  final List<Movie> movies;
  

  @override
  List<Object?> get props => [movies];
}
