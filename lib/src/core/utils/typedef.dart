import 'package:dartz/dartz.dart';
import 'package:flutter_toy/src/core/error/failure.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;
typedef ResultVoid = ResultFuture<void>;