import 'package:flutter/material.dart';
import 'package:my_flutter_app/design_system/tokens/tokens_provider.dart';
import 'package:my_flutter_app/design_system/typography/typography_extension.dart';
import 'package:my_flutter_app/features/movies/domain/models/movies.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({super.key, required this.movie});
  final Movie movie;

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastLinearToSlowEaseIn,
    );
    _toggleContainer();
  }

  @override
  void dispose() {
    _toggleContainer();
    super.dispose();
  }

  _toggleContainer() {
    if (_animation.status != AnimationStatus.completed) {
      _controller.forward();
    } else {
      _controller.animateBack(0, duration: const Duration(seconds: 1));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: _animation,
      axis: Axis.vertical,
      child: _ConterntMovie(
        movie: widget.movie,
      ),
    );
  }
}

class _ConterntMovie extends StatelessWidget {
  const _ConterntMovie({
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return _BackgroundImage(
      backdropPath: movie.backdropPath,
      child: Padding(
        padding: EdgeInsets.all(context.dimessions.spacers.spacer32),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _MovieImage(posterPath: movie.posterPath),
            SizedBox(
              width: context.dimessions.spacers.spacer32,
            ),
            Expanded(
              child: _MovieDescription(movie: movie),
            ),
          ],
        ),
      ),
    );
  }
}

class _MovieDescription extends StatelessWidget {
  const _MovieDescription({
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${movie.originalTitle} (${movie.releaseDate.year})',
          style: context.typography.title.h1.bold.white,
        ),
        Text(
          movie.overview,
          style: context.typography.body.large.semibold.white,
        ),
      ],
    );
  }
}

class _MovieImage extends StatelessWidget {
  const _MovieImage({
    required this.posterPath,
  });

  final String posterPath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Image.network(
        'https://media.themoviedb.org/t/p/w220_and_h330_face$posterPath',
        fit: BoxFit.cover,
        excludeFromSemantics: true,
      ),
    );
  }
}

class _BackgroundImage extends StatelessWidget {
  const _BackgroundImage({required this.child, required this.backdropPath});

  final Widget child;
  final String backdropPath;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
          color: context.colors.foreground.primary.medium,
          image: DecorationImage(
            filterQuality: FilterQuality.high,
            fit: BoxFit.cover,
            opacity: 0.2,
            image: NetworkImage(
                'https://media.themoviedb.org/t/p/w533_and_h300_bestv2$backdropPath'),
          ),
        ),
        child: child);
  }
}
