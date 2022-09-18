part of 'signin_bloc.dart';

@immutable
abstract class SigninEvent {}

class SignInRequestEvent extends SigninEvent {
  final String? email;
  final String? password;

  SignInRequestEvent({
    required this.email,
    required this.password,
  });

}

