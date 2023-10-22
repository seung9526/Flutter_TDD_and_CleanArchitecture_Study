import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_toy/src/authentication/domian/data/models/user_model.dart';
import 'package:flutter_toy/src/authentication/domian/entities/user.dart';

void main(){
  const tModel = UserModel.empty();

  test('should be a subclass of [User] entity', () {

    // Assert
    expect(tModel, isA<User>());
  });

  group('fromMap', () {
    test('should return a [UserModel] with the right data', () {
     // Arrange
      final tJson = File('test/fixtures/user.json').readAsBytesSync();
      print(tJson);

     // Act
     //final result = UserModel.fromMap(map);

     // Assert
    });
  });
}