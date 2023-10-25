import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_toy/src/authentication/domian/data/datasources/authentication_remote_data_source.dart';
import 'package:flutter_toy/src/core/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  late http.Client client;
  late AuthenticationRemoteDataSource remoteDataSource;

  setUp(() {
    client = MockClient();
    remoteDataSource = AuthRemoteDataSrcImpl(client);
    registerFallbackValue(Uri());
  });

  group('createUsers', () {
    test(
      'should complete successfully when the status code is 200 or 201',
      () async {
        when(() => client.post(any(), body: any(named: 'body'))).thenAnswer(
          (_) async => http.Response('User created successfully', 201),
        );

        final methodCall = await remoteDataSource.createUsers;

        expect(
            methodCall(
              createdAt: 'createdAt',
              name: 'name',
              avatar: 'avatar',
            ),
            completes);

        verify(
          () => client.post(Uri.parse('$kBaseUrl$kCreateUserEndopint'),
              body: jsonEncode({
                'createdAt': 'createdAt',
                'name': 'name',
                'avatar': 'avatar',
              })),
        ).called(1);

        verifyNoMoreInteractions(client);
      },
    );
  });
}
