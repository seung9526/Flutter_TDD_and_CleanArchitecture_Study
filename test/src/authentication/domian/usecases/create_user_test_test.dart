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


import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_toy/src/authentication/domian/repositories/authentication_repository.dart';
import 'package:flutter_toy/src/authentication/domian/usecases/create_user.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepo extends Mock implements AuthenticationRepository {

}

void main(){
  late CreateUser usecase;
  late AuthenticationRepository repository;

  setUpAll((){
    repository = MockAuthRepo();
    usecase = CreateUser(repository);
  });

  test('should call the [AuthRepo.createUser]', () async{
    // Arrange
    when(() => repository.createUser(
        createdAt: any(),
        name: name,
        avater: avater))
    ;
    // Act
    usecase(params);
    // Assert
  });
}