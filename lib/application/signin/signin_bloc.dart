import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ghp_app/utils/failures/signin_failure.dart';
import 'package:meta/meta.dart';

import '../../domain/repositories/signin_repository.dart';

part 'signin_event.dart';

part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  final SigninRepository signinRepository;

  SigninBloc({required this.signinRepository})
      : super(SigninState(
            isSubmitting: false,
            showValidationMessage: false,
            signinFailureOrSuccess: none())) {
    on<SignInRequestEvent>((event, emit) async {

      if (event.email == null || event.password == null) {
        emit(state.copyWith(showValidationMessage: true, isSubmitting: false));
      } else {
        emit(state.copyWith(showValidationMessage: false, isSubmitting: true));

        final failureOrSuccess = await signinRepository.signinUser(event.email!, event.password!);

        emit(state.copyWith(isSubmitting: false, signinFailureOrSuccess: optionOf(failureOrSuccess)));
      }
    });
  }
}
