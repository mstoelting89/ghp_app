
import 'package:ghp_app/infrastructure/model/signin_model.dart';

class SigninEntity {
  final String email;
  final String token;
  final String role;

  const SigninEntity({
    required this.email,
    required this.token,
    required this.role,
  });

  factory SigninEntity.encodeModel(SigninModel signinModel) {
    String role = signinModel.role.elementAt(0)['authority'];
    return SigninEntity(email: signinModel.email, token: signinModel.token, role: role);
  }
}