import 'package:dartz/dartz.dart';
import 'package:flutter_toy/src/authentication/domian/data/models/user_model.dart';

abstract class AuthenticationRemoteDataSource {
  Future<void> createUsers({
    required String createdAt,
    required String name,
    required String avatar,
  });

  Future<List<UserModel>> getUsers();
}