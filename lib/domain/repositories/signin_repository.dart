

import 'package:dartz/dartz.dart';

import '../../utils/failures/failure.dart';
import '../../utils/failures/signin_failure.dart';
import '../entities/signin_entity.dart';

abstract class SigninRepository {
  Future<Either<SigninFailure, Unit>> signinUser(String email, String password);
}