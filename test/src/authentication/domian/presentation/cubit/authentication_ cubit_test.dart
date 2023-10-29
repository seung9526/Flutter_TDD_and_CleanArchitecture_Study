import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_toy/src/authentication/domian/presentation/cubit/authentication_cubit.dart';
import 'package:flutter_toy/src/authentication/domian/usecases/create_user.dart';
import 'package:flutter_toy/src/authentication/domian/usecases/get_users.dart';
import 'package:mocktail/mocktail.dart';

class MockGetUsers extends Mock implements GetUsers {}
class MockCreateUser extends Mock implements CreateUser {}

void main() {
  late GetUsers getUsers;
  late CreateUser createUser;
  late AuthenticationCubit cubit;

  setUp(() {
    getUsers = MockGetUsers();
    createUser = MockCreateUser();
    cubit = AuthenticationCubit(createUser: createUser, getUsers: getUsers);
  });
}