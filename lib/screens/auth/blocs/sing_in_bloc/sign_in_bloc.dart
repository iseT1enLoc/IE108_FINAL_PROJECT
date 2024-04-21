import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final UserRepository _userRepository;
  bool _isSignedIn = false;
  SignInBloc(this._userRepository) : super(SignInInitial()) {
    on<SignInRequired>((event, emit) async {
      /* emit(SignInProcess());
      try {
        emit(SignInSuccess());
        await _userRepository.signIn(event.email, event.password);
        return;
      } catch (e) {
        emit(SignInFailure());
      } */
      if (!_isSignedIn) {
        // Check if already signed in (optional)
        emit(SignInProcess());
        try {
          await _userRepository.signIn(event.email, event.password);
          _isSignedIn = true; // Update flag upon successful sign-in (optional)
          emit(SignInSuccess());
        } catch (e) {
          emit(SignInFailure());
        }
      }
    });

    on<SignOutRequired>((event, emit) async => await _userRepository.logOut());
  }
}
/*
class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final UserRepository _userRepository;
  bool _isSignedIn = false;

  SignInBloc(this._userRepository) : super(SignInInitial()) {
    on<SignInRequired>((event, emit) async {
      if (!_isSignedIn) {
        emit(SignInProcess());
        try {
          await _userRepository.signIn(event.email, event.password);
          _isSignedIn = true; // Set flag to true upon successful sign-in
          emit(SignInSuccess()); // Emit success state after successful sign-in
        } catch (e) {
          emit(SignInFailure());
        }
      }
    });

    on<SignOutRequired>((event, emit) async {
      await _userRepository.logOut();
      _isSignedIn = false; // Reset flag upon sign-out
    });
  }
}
*/