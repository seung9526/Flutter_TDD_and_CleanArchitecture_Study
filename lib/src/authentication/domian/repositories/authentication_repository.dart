import 'package:flutter_toy/src/authentication/domian/entities/user.dart';
import 'package:flutter_toy/src/core/utils/typedef.dart';

abstract class AuthenticationRepository {
  const AuthenticationRepository();

  ResultVoid createUser({
    required String createdAt,
    required String name,
    required String avater,
  });

  ResultFuture<List<User>> getUsers();
}