import 'dart:convert';

import 'package:flutter_toy/src/authentication/domian/data/models/user_model.dart';
import 'package:flutter_toy/src/core/utils/constants.dart';
import 'package:http/http.dart'as http ;

abstract class AuthenticationRemoteDataSource {
  Future<void> createUsers({
    required String createdAt,
    required String name,
    required String avatar,
  });

  Future<List<UserModel>> getUsers();
}

const kCreateUserEndopint = '/users';
const kGetUsersEndpoint = '/user';

class AuthRemoteDataSrcImpl implements AuthenticationRemoteDataSource {

  const AuthRemoteDataSrcImpl(this._client);

  final http.Client _client;

  @override
  Future<void> createUsers({
    required String createdAt,
    required String name,
    required String avatar,
  }) async {
    // 1. check to make sure that it returns the right data when the response
    // code is 200 or the proper response code
    // 2. check to make sure that it "THROWS A CUSTOM EXCEPTION" with the
    // right message when statues code is the bad one
    /*final response =*/ await _client.post(Uri.parse('$kBaseUrl$kCreateUserEndopint'),
      body: jsonEncode({
        'createdAt' : createdAt,
        'name' : name,
        'avatar' : avatar,
      }),
    );
  }

  @override
  Future<List<UserModel>> getUsers() async {
    // TODO: implement getUsers
    throw UnimplementedError();
  }
}
