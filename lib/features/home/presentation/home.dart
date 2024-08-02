import 'package:flutter/material.dart';
import 'package:my_flutter_app/design_system/components/app_bar/app_bar_movie_app.dart';
import 'package:my_flutter_app/design_system/tokens/tokens_provider.dart';
import 'package:my_flutter_app/features/movies/presentation/providers/movies_now_playing_provider.dart';
import 'package:my_flutter_app/features/movies/presentation/providers/movies_popular_playing_provider.dart';
import 'package:my_flutter_app/features/movies/presentation/providers/movies_top_rated_provider.dart';
import 'package:my_flutter_app/features/movies/presentation/providers/movies_upcoming_provider.dart';
import 'package:my_flutter_app/features/movies/presentation/widgets/movie_carrousel.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.foreground.primary.light,
      appBar: const AppBarMovieApp(
        title: 'Movies App',
      ),
      body:  const SingleChildScrollView(
        child: Column(
          children: [
            MoviesNowPlayingProvider(
              child: MovieCarrousel(
                title: 'Now Playng Movies',
              ),
            ),
            MoviesTopRatedProvider(
              child: MovieCarrousel(
                title: 'Top Rated',
              ),
            ),
            MoviesUpcomingProvider(
              child: MovieCarrousel(
                title: 'Upcoming Movies',
              ),
            ),
            MoviesPopularProvider(
              child: MovieCarrousel(
                title: 'Popular Movies',
              ),
            )
          ],
        ),
      ),
    );
  }
}
