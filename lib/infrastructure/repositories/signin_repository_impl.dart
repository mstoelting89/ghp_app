

import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ghp_app/domain/entities/signin_entity.dart';
import 'package:ghp_app/utils/exceptions/exceptions.dart';
import 'package:ghp_app/utils/failures/failure.dart';
import 'package:ghp_app/domain/repositories/signin_repository.dart';
import 'package:ghp_app/infrastructure/datasources/signin_datasource.dart';
import 'package:ghp_app/utils/failures/signin_failure.dart';

class SigninRepositoryImpl implements SigninRepository {
  final SigninDatasource signinDatasource;
  final _storage = const FlutterSecureStorage();

  const SigninRepositoryImpl({
    required this.signinDatasource,
  });

  @override
  Future<Either<SigninFailure, Unit>> signinUser(String email, String password) async {
    try {
      final signinEntity = await signinDatasource.signinUser(email, password);
      _storage.write(key: 'token', value: signinEntity.token);
      _storage.write(key: 'email', value: signinEntity.email);
      _storage.write(key: 'role', value: signinEntity.role);

      return right(unit);
    } catch (e) {
      if (e is UserNotFoundException) {
        return left(CredentialsFailure());
      } else if (e is ServerException) {
        return left(ServerFailure());
      } else {
        return left(ServerFailure());
      }
    }
  }
}