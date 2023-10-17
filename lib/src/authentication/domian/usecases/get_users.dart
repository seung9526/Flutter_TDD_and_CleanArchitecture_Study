import 'package:flutter_toy/src/authentication/domian/entities/user.dart';
import 'package:flutter_toy/src/authentication/domian/repositories/authentication_repository.dart';
import 'package:flutter_toy/src/core/usecase/usecase.dart';
import 'package:flutter_toy/src/core/utils/typedef.dart';

class GetUsers extends UsecaseWithOutParams<List<User>>{
  const GetUsers(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultFuture<List<User>> call() async => _repository.getUsers();
}