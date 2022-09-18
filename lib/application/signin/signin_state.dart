part of 'signin_bloc.dart';

class SigninState {
  final bool isSubmitting;
  final bool showValidationMessage;
  final Option<Either<SigninFailure, Unit>> signinFailureOrSuccess;

  const SigninState({
    required this.isSubmitting,
    required this.showValidationMessage,
    required this.signinFailureOrSuccess,
  });

  SigninState copyWith({
    bool? isSubmitting,
    bool? showValidationMessage,
    Option<Either<SigninFailure, Unit>>? signinFailureOrSuccess,
  }) {
    return SigninState(
      isSubmitting: isSubmitting ?? this.isSubmitting,
      showValidationMessage:
          showValidationMessage ?? this.showValidationMessage,
      signinFailureOrSuccess:
          signinFailureOrSuccess ?? this.signinFailureOrSuccess,
    );
  }
}