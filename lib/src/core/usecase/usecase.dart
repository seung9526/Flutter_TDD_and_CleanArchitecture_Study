import 'package:flutter_toy/src/core/utils/typedef.dart';

abstract class UsecaseWithParams<Type, Params>{
  const UsecaseWithParams();
  ResultFuture<Type> call(Params params);
}

abstract class UsecaseWithOutParams<Type>{
  const UsecaseWithOutParams();
  ResultFuture<Type> call();
}