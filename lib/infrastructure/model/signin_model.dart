
import 'package:ghp_app/domain/entities/signin_entity.dart';

class SigninModel {
  final String email;
  final String token;
  final List<dynamic> role;

  SigninModel({required this.email, required this.token, required this.role});

  factory SigninModel.fromJson(Map<String, dynamic> json) {
    return SigninModel(email: json['email'], token: json['token'], role: json['role']);
  }


}