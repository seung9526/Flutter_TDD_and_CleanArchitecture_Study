import 'package:dartz/dartz.dart';
import 'package:flutter_toy/src/authentication/domian/data/datasources/authentication_remote_data_source.dart';
import 'package:flutter_toy/src/authentication/domian/entities/user.dart';
import 'package:flutter_toy/src/authentication/domian/repositories/authentication_repository.dart';
import 'package:flutter_toy/src/core/error/exceptions.dart';
import 'package:flutter_toy/src/core/error/failure.dart';
import 'package:flutter_toy/src/core/utils/typedef.dart';

class AuthenticationRepositoryImplementation
    implements AuthenticationRepository {

  const AuthenticationRepositoryImplementation(
    this._remoteDataSource);

  final AuthenticationRemoteDataSource _remoteDataSource;


  @override
  ResultVoid createUser({
    required String createdAt,
    required String name,
    required String avatar
  }) async {
    // Test - Driven Development
    // 원격 데이터 소스 호출
    // 메소드가 적절한 데이터를 반환하는지 확인
    // // remoteDataSource가 예외를 던질때 다음을 반환
    // 실패하고 예외가 발생하지 않으면 실제 데이터 반환
    // 예상 데이터
    try {
      await _remoteDataSource.createUsers(
          createdAt: createdAt,
          name: name,
          avatar: avatar);
      return const Right(null);
    } on APIException catch(e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<User>> getUsers() async{
    // TODO: implement getUsers
    throw UnimplementedError();
  }

}