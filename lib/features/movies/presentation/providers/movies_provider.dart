import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_app/features/movies/data/data_sources/movies_data_source.dart';
import 'package:my_flutter_app/features/movies/data/data_sources/movies_data_source_impl.dart';
import 'package:my_flutter_app/features/movies/data/repositories/movies_repository_impl.dart';
import 'package:my_flutter_app/features/movies/domain/repositories/movies_repository.dart';
import 'package:my_flutter_app/infrastructure/api/api_rest.dart';

class MoviesProvider extends StatelessWidget {
  const MoviesProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        RepositoryProvider<MoviesDataSource>(
          create: (context) => MoviesDataSourceImpl(context.read<ApiRest>()),
        ),
        RepositoryProvider<MoviesRepository>(
          create: (context) =>
              MoviesRepositoryImpl(context.read<MoviesDataSource>()),
        ),
      ],
      child: child,
    );
  }
}
