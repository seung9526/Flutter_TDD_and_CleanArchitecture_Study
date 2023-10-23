/* what does the class depend on
* Answer -- AuthenticationRepository
*
* how can we create a fake version of the dependency
* Answer -- Use Mocktail
*
* how do we control what our dependencies do
* Answer -- Using the Mocktail's APIs
*
* */

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_toy/src/authentication/domian/repositories/authentication_repository.dart';
import 'package:flutter_toy/src/authentication/domian/usecases/create_user.dart';
import 'package:mocktail/mocktail.dart';

import 'authentication_repository.mock.dart';

void main() {
  late CreateUser usecase;
  late AuthenticationRepository repository;

  setUpAll(() {
    repository = MockAuthRepo();
    usecase = CreateUser(repository);
  });

  const params = CreateUserParams.empty();

  test(
    'should call the [AuthRepo.createUser]',
    () async {
      // Arrange
      // STUB
      when(
        () => repository.createUser(
          createdAt: any(named: 'createdAt'),
          name: any(named: 'name'),
          avatar: any(named: 'avatar'),
        ),
        // Right(null) 오른쪽 값이 성공, 즉 비어있으면 성공이라는 것
        // dartz의 패키지의 Either 오른쪽 값을 나타냄
      ).thenAnswer((_) async => const Right(null));
      // Action
      final result = await usecase(params);

      // Assert
      expect(result, equals(const Right<dynamic, void>(null)));
      verify(
        () => repository.createUser(
            createdAt: params.createdAt,
            name: params.name,
            avatar: params.avatar),
      ).called(1);

      verifyNoMoreInteractions(repository);
    },
  );
}
