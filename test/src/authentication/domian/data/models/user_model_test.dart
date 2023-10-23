import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_toy/src/authentication/domian/data/models/user_model.dart';
import 'package:flutter_toy/src/authentication/domian/entities/user.dart';
import 'package:flutter_toy/src/core/utils/typedef.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main(){
  const tModel = UserModel.empty();

  test('should be a subclass of [User] entity', () {

    // Assert
    expect(tModel, isA<User>());
  });
  
  final tJson = fixture('user.json');
  final tMap = jsonDecode(tJson) as DataMap;

  group('fromMap', () {
    test('should return a [UserModel] with the right data', () {
     // Act
     final result = UserModel.fromMap(tMap);
     expect(result, equals(tModel));

     // Assert
    });
  });

  group('fromJson', () {
    test('should return a [UserModel] with the right data', () {

      final result = UserModel.fromJson(tJson);
      expect(result, equals(tModel));
    });
  });

  group('toJson', () {
    test('should return a [Map] with the right data', () {

      final result = tModel.toMap();
      expect(result, equals(tMap));
    });
  });

  group('toMap', () {
    test('should return a [Json] with the right data', () {
      // Act
      final result = tModel.toJson();
      final tJson = jsonEncode({
        "id": "1",
        "avatar": "_empty.avatar",
        "createdAt": "_empty.createdAt",
        "name": "_empty.name"
      });

      // Assert
      expect(result, tJson);
    });
  });

  group('copyWith', () {
    test('should return a [UserModel] with the right data', () {
    // Arrange

    // Act
    final result = tModel.copyWith(name: 'min');

    expect(result.name, equals('min'));
    });
  });
}