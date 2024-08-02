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
import 'package:equatable/equatable.dart';
import 'package:my_flutter_app/infrastructure/base/failure/movie_app_failure.dart';

abstract class UseCaseBase<Result, Params> {
  Future<Either<MovieAppFailure, Success<Result>>> call(Params params);

  Either<MovieAppFailure, Success<Result>> success(Result result) =>
      Right(Success<Result>(result: result));
  Either<MovieAppFailure, Success<Result>> failed(MovieAppFailure failure) =>
      Left(failure);
}

class Success<T> extends Equatable {
  const Success({
    required this.result,
  });
  final T result;

  @override
  List<Object?> get props => [result];
} 
