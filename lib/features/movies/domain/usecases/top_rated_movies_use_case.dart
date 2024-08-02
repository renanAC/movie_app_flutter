/*
 * Copyright 2023 ArcTouch LLC.
 *
 * All rights reserved.
 *
 * This file, its contents, concepts, methods, behavior, and operation
 * (collectively the “Software”) are protected by trade secret, patent,
 * and copyright laws. The use of the Software is governed by a license
 * agreement. Disclosure of the Software to third parties, in any form,
 * in whole or in part, is expressly prohibited except as authorized by
 * the license agreement.
 */

import 'package:dartz/dartz.dart';
import 'package:my_flutter_app/features/movies/domain/models/movies.dart';
import 'package:my_flutter_app/features/movies/domain/repositories/movies_repository.dart';
import 'package:my_flutter_app/infrastructure/base/failure/movie_app_failure.dart';
import 'package:my_flutter_app/infrastructure/base/use_case_base.dart';

class TopRatedMoviesUseCase extends UseCaseBase<Movies, int> {
  TopRatedMoviesUseCase(this._moviesRepository);

  final MoviesRepository _moviesRepository;

  @override
  Future<Either<MovieAppFailure, Success<Movies>>> call(params) async {
    try {
      return success(await _moviesRepository.getTopRatedMovies(params));
    } catch (error) {
      return failed(UnknowFailure());
    }
  }
}
