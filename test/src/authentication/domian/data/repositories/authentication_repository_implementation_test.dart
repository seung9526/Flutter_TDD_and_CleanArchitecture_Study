import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_toy/src/authentication/domian/data/datasources/authentication_remote_data_source.dart';
import 'package:flutter_toy/src/authentication/domian/data/repositories/authentication_repository_implementation.dart';
import 'package:flutter_toy/src/authentication/domian/entities/user.dart';
import 'package:flutter_toy/src/core/error/exceptions.dart';
import 'package:flutter_toy/src/core/error/failure.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRemoteDataSrc extends Mock
    implements AuthenticationRemoteDataSource {}

void main() {
  late AuthenticationRemoteDataSource remoteDataSource;
  late AuthenticationRepositoryImplementation repoImpl;

  setUp(() {
    remoteDataSource = MockAuthRemoteDataSrc();
    repoImpl = AuthenticationRepositoryImplementation(remoteDataSource);
  });

  const tException =
      APIException(message: 'Unknown Error Occurred', statusCode: 500);

  group('createUser', () {
    const createdAt = 'whatever.createdAt';
    const name = 'whatever.name';
    const avatar = 'whatever.avatar';
    test(
      'should call the [RemoteDatasource.createUsers] and complete'
      'successfully when the call to the remote source is successful',
      () async {
        // arrange
        when(
          () => remoteDataSource.createUsers(
              createdAt: any(named: 'createdAt'),
              name: any(named: 'name'),
              avatar: any(named: 'avatar')),
        ).thenAnswer((_) async => Future.value());

        const createdAt = 'whatever.createdAt';
        const name = 'whatever.name';
        const avatar = 'whatever.avatar';

        // act
        final result = await repoImpl.createUser(
            createdAt: createdAt, name: name, avatar: avatar);

        // assert
        expect(result, equals(const Right(null)));
        verify(() => remoteDataSource.createUsers(
            createdAt: createdAt, name: name, avatar: avatar)).called(1);
        verifyNoMoreInteractions(remoteDataSource);
      },
    );

    test(
      'should return a [ServerFailure] when te call to the remote'
      ' source is unsuccessful',
      () async {
        // Arrange
        when(() => remoteDataSource.createUsers(
            createdAt: any(named: 'createdAt'),
            name: any(named: 'name'),
            avatar: any(named: 'avatar'))).thenThrow(tException);

        final result = await repoImpl.createUser(
          createdAt: createdAt,
          name: name,
          avatar: avatar,
        );

        expect(
          result,
          equals(
            Left(
              APIFailure(
                message: tException.message,
                statusCode: tException.statusCode,
              ),
            ),
          ),
        );
        verify(() => remoteDataSource.createUsers(
            createdAt: createdAt, name: name, avatar: avatar)).called(1);
        verifyNoMoreInteractions(remoteDataSource);
      },
    );
  });
  group('getUser', () {
    test(
      'should call the [RemoteDataSource.getUsers] and return [List<User>]'
      'when call to remote source is successful',
      () async {
        when(() => remoteDataSource.getUsers()).thenAnswer(
          (_) async => [],
        );

        final result = await repoImpl.getUsers();

        expect(result, isA<Right<dynamic, List<User>>>());
        verify(() => remoteDataSource.getUsers()).called(1);
        verifyNoMoreInteractions(remoteDataSource);
      },
    );

    test('should return a [APIFailure] when the call to the remote '
        'source is unsuccessful', () async {
        when(() => remoteDataSource.getUsers()).thenThrow(tException);

        final result = await repoImpl.getUsers();

        expect(result, equals(Left(APIFailure.fromException(tException))));
        verify(() => remoteDataSource.getUsers()).called(1);
        verifyNoMoreInteractions(remoteDataSource);
    });
  });
}
