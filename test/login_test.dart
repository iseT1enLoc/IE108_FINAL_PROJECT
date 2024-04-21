import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pizza_app/screens/auth/blocs/sing_in_bloc/sign_in_bloc.dart';
import 'package:user_repository/user_repository.dart';
import 'package:bloc_test/bloc_test.dart';

// Your imports and classes

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockUserRepo extends Mock implements UserRepository {}

class MockUser extends Mock implements User {}

void main() {
  group('SignInBloc', () {
    late MockFirebaseAuth mockFirebaseAuth;
    late MockUserRepo mock_user_repo;
    late MockUser mock_user;

    setUp(() {
      mockFirebaseAuth = MockFirebaseAuth();
      mock_user_repo = MockUserRepo();
      mock_user = MockUser();
    });
    blocTest<SignInBloc, SignInState>(
      'emits [] when no events are added',
      build: () => SignInBloc(MockUserRepo()),
      expect: () => [],
    );

    blocTest<SignInBloc, SignInState>(
      'emits [SignInProcess, SignInSuccess] for successful login',
      build: () {
        return SignInBloc(mock_user_repo);
      },
      act: (bloc) async {
        bloc.add(SignInRequired('', '')); //replace with the approriate password
      },
      setUp: () => when(() => mock_user_repo.signIn('', ''))
          .thenAnswer((_) => Future.value(true)),
      expect: () => [SignInProcess(), SignInSuccess()],
    );
    blocTest<SignInBloc, SignInState>(
      'emits [SignInProcess, SignInFailure] for sign-in failure',
      build: () => SignInBloc(mock_user_repo),
      act: (bloc) =>
          bloc.add(SignInRequired('test@example.com', 'wrongpassword')),
      setUp: () => when(
              () => mock_user_repo.signIn('test@example.com', 'wrongpassword'))
          .thenThrow(Exception('Invalid credentials')), // Mock sign-in failure
      expect: () => [
        SignInProcess(),
        SignInFailure(),
      ],
    );
  });
}
