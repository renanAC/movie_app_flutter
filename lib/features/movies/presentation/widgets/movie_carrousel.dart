import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:my_flutter_app/design_system/tokens/tokens_provider.dart';
import 'package:my_flutter_app/features/movies/domain/models/movies.dart';
import 'package:my_flutter_app/features/movies/presentation/blocs/movies_cubit.dart';
import 'package:my_flutter_app/features/movies/presentation/widgets/movie_details.dart';
import 'package:my_flutter_app/features/movies/presentation/widgets/movie_item.dart';

class MovieCarrousel extends StatefulWidget {
  const MovieCarrousel({super.key, required this.title});
  final String title;

  @override
  State<MovieCarrousel> createState() => _MovieCarrouselState();
}

class _MovieCarrouselState extends State<MovieCarrousel> {
  late final MoviesCubit _moviesCubit;

  Movie? selectedMovie;

  @override
  void initState() {
    _moviesCubit = context.read<MoviesCubit>();
    _moviesCubit.getMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit, MoviesState>(builder: (context, state) {
      return Padding(
        padding: EdgeInsets.all(context.dimessions.spacers.spacer16),
        child: TapRegion(
          onTapOutside: (_) => _selectMovie(null),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: context.typography.title.h2,
              ),
              SizedBox(
                height: context.dimessions.spacers.spacer16,
              ),
              if (state is MoviesSuccessState) ...{
                _MoviesLoaded(
                  state: state,
                  loadMoreMovies: _moviesCubit.loadMoreMovies,
                  onTapItem: (movie) => _selectMovie(movie),
                )
              },
              if (state is MoviesLoadingState) ...{_MoviesLoading()},
              if (state is MoviesErrorState) ...{_MoviesError()},
              if (selectedMovie != null) ...{
                MovieDetails(
                  movie: selectedMovie!,
                ),
              }
            ],
          ),
        ),
      );
    });
  }

  void _selectMovie(Movie? movie) {
    return setState(() {
      selectedMovie = movie;
    });
  }
}

class _MoviesLoaded extends StatelessWidget {
  const _MoviesLoaded({
    required this.state,
    required this.loadMoreMovies,
    required this.onTapItem,
  });
  final MoviesSuccessState state;
  final void Function() loadMoreMovies;
  final void Function(Movie movie) onTapItem;

  @override
  Widget build(BuildContext context) {
    const double movieImageHeightSize = 200;
    final movies = state.movies;
    return SizedBox(
      height: movieImageHeightSize,
      child: LazyLoadScrollView(
        onEndOfPage: loadMoreMovies,
        scrollDirection: Axis.horizontal,
        child: ListView.separated(
          itemCount: movies.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            var movie = movies[index];
            return GestureDetector(
              onTap: () => onTapItem(movie),
              child: MovieItem(
                image: movie.posterPath,
                semanticLabel: movie.title,
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              width: context.dimessions.spacers.spacer24,
            );
          },
        ),
      ),
    );
  }
}

class _MoviesLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text('Loading');
  }
}

class _MoviesError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text('Error');
  }
}
