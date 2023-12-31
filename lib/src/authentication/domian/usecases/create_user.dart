
// 단일 책임 원칙을 사용하기 위해 작성
import 'package:equatable/equatable.dart';
import 'package:flutter_toy/src/authentication/domian/repositories/authentication_repository.dart';
import 'package:flutter_toy/src/core/usecase/usecase.dart';
import 'package:flutter_toy/src/core/utils/typedef.dart';

class CreateUser extends UsecaseWithParams<void, CreateUserParams> {
  const CreateUser(this. _repository);

  final AuthenticationRepository _repository;

  @override
  ResultVoid call(CreateUserParams params) async => _repository.createUser(
    createdAt: params.createdAt,
    name: params.name,
    avatar: params.avatar,
  );
}

class CreateUserParams extends Equatable {

  const CreateUserParams({
    required this.createdAt,
    required this.name,
    required this.avatar,
  });

  const CreateUserParams.empty() :
      this(createdAt: '_empty.createdAt',
      name: '_empty.name',
        avatar: '_empty.avatar'
      );

  final String createdAt;
  final String name;
  final String avatar;

  @override
  // TODO: implement props
  List<Object?> get props => [createdAt, name, avatar];
}