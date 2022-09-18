import 'dart:convert';

import 'package:ghp_app/domain/entities/signin_entity.dart';
import 'package:ghp_app/infrastructure/model/signin_model.dart';
import 'package:ghp_app/utils/exceptions/exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';

import '../../utils/failures/failure.dart';

abstract class SigninDatasource {
  Future<SigninEntity> signinUser(String email, String password);
}

class SigninDatasourceImpl implements SigninDatasource {
  final http.Client client;

  const SigninDatasourceImpl({
    required this.client,
  });

  @override
  Future<SigninEntity> signinUser(String email, String password) async {

    final response = await client.post(
        Uri.parse("https://api.ghp.stoelting-michael.de/api/v1/login"),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({"email": email, "password": password})
    );

    if (response.statusCode == 200) {
      return SigninEntity.encodeModel(SigninModel.fromJson(json.decode(response.body)));
    } else if (response.statusCode == 404) {
      throw UserNotFoundException();
    } else {
      throw ServerException();
    }
  }
}
