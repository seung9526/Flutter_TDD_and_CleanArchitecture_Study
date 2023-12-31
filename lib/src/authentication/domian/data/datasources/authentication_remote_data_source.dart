import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_toy/src/authentication/domian/data/models/user_model.dart';
import 'package:flutter_toy/src/core/error/exceptions.dart';
import 'package:flutter_toy/src/core/utils/constants.dart';
import 'package:flutter_toy/src/core/utils/typedef.dart';
import 'package:http/http.dart'as http ;

abstract class AuthenticationRemoteDataSource {
  Future<void> createUsers({
    required String createdAt,
    required String name,
    required String avatar,
  });

  Future<List<UserModel>> getUsers();
}

const kCreateUserEndpoint = '/test-api/users';
const kGetUsersEndpoint = '/test-api/users';

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
    try{
      final response = await _client.post(
        Uri.https(kBaseUrl, kGetUsersEndpoint),
        body: jsonEncode({
          'createdAt' : createdAt,
          'name' : name,
          'avatar' : avatar,
        }),
        headers: {
          'Content-Type' : 'application/json'
        }
      );

      if(response.statusCode != 200 && response.statusCode != 201){
        throw APIException(
            message: response.body,
            statusCode: response.statusCode
        );
      }
    } on APIException {
      rethrow;
    } catch (e){
      throw APIException(message: e.toString(), statusCode: 505);
    }
  }

  @override
  Future<List<UserModel>> getUsers() async {
    try {
      final response = await _client.get(
        Uri.https(kBaseUrl, kGetUsersEndpoint),
      );
      debugPrint(Uri.https(kBaseUrl, kGetUsersEndpoint).toString());
      if (response.statusCode != 200) {
        throw APIException(
          message: response.body,
          statusCode: response.statusCode,
        );
      }

      return List<DataMap>.from(jsonDecode(response.body) as List)
          .map((userData) => UserModel.fromMap(userData))
          .toList();
    } on APIException{
      rethrow;
    } catch (e) {
      throw APIException(message: e.toString(), statusCode: 505);
    }
  }
}
