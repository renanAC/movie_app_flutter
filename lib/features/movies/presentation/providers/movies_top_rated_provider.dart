import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_app/features/movies/domain/models/movies.dart';
import 'package:my_flutter_app/features/movies/domain/repositories/movies_repository.dart';
import 'package:my_flutter_app/features/movies/domain/usecases/top_rated_movies_use_case.dart';
import 'package:my_flutter_app/features/movies/presentation/blocs/movies_cubit.dart';
import 'package:my_flutter_app/infrastructure/base/use_case_base.dart';

class MoviesTopRatedProvider extends StatelessWidget {
  const MoviesTopRatedProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        RepositoryProvider<UseCaseBase<Movies, int>>(
          create: (context) =>
              TopRatedMoviesUseCase(context.read<MoviesRepository>()),
        ),
        BlocProvider<MoviesCubit>(
          create: (context) =>
              MoviesCubit(context.read<UseCaseBase<Movies, int>>()),
        ),
      ],
      child: child,
    );
  }
}