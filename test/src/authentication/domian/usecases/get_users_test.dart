
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_toy/src/authentication/domian/repositories/authentication_repository.dart';
import 'package:flutter_toy/src/authentication/domian/usecases/get_users.dart';

import 'authentication_repository.mock.dart';

void main(){
  late GetUsers usecase;
  late AuthenticationRepository repository;

  setUp(() {
    repository = MockAuthRepo();
    usecase = GetUsers(repository);
  });

  test('should call [AuthRepo.getUsers] and return [List<User>]',() async {

  });
}