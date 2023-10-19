import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_toy/src/authentication/domian/entities/user.dart';
import 'package:flutter_toy/src/authentication/domian/repositories/authentication_repository.dart';
import 'package:flutter_toy/src/authentication/domian/usecases/get_users.dart';
import 'package:mocktail/mocktail.dart';

import 'authentication_repository.mock.dart';

void main() {
  late GetUsers usecase;
  late AuthenticationRepository repository;

  setUp(() {
    repository = MockAuthRepo();
    usecase = GetUsers(repository);
  });

  const tResponse = [User.empty()];

  test(
    'should call [AuthRepo.getUsers] and return [List<User>]',
    () async {
      // Arrange
      when(
        () => repository.getUsers(),
      ).thenAnswer(
        (_) async => const Right(tResponse),
      );

      // act
      final result = await usecase();

      expect(result, equals(const Right<dynamic, List<User>> (tResponse)));
      verify(() => repository.getUsers()).called(1);
      verifyNoMoreInteractions(repository);

    },
  );
}
