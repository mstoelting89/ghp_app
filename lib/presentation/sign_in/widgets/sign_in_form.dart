import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghp_app/application/signin/signin_bloc.dart';
import 'package:ghp_app/presentation/routes/router.gr.dart';
import 'package:ghp_app/utils/custom_button.dart';
import 'package:ghp_app/utils/failures/signin_failure.dart';

import '../../../application/news/news_bloc.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late String _email;
    late String? _password;
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    String? validateEmail(String? email) {
      const emailRegex =
          r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";

      if (email == null || email.isEmpty) {
        return "Es ist keine Email Adresse eingegeben";
      } else if (RegExp(emailRegex).hasMatch(email)) {
        _email = email;
        return null;
      } else {
        return "Die Email hat ein falsches Format";
      }
    }

    String? validatePassword(String? password) {
      _password = password;
      return null;
    }

    String mapFailureMessage(SigninFailure failure) {
      switch (failure.runtimeType) {
        case ServerFailure:
          return "Oops! Irgendetwas ist schiefgelaufen.";
        case CredentialsFailure:
          return "Oops! Email oder Passwort passen nicht zueinander.";
        default:
          return "Oops! Irgendetwas ist schiefgelaufen.";
      }
    }

    final themeData = Theme.of(context);
    return BlocConsumer<SigninBloc, SigninState>(
      listenWhen: (p, c) =>
          p.signinFailureOrSuccess != c.signinFailureOrSuccess,
      listener: (context, state) {
        state.signinFailureOrSuccess.fold(
            () => {},
            (failureOrSuccess) => failureOrSuccess.fold(
                (failure) => {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            mapFailureMessage(failure),
                            style: themeData.textTheme.bodyText1,
                          ),
                          backgroundColor: Colors.redAccent,
                        ),
                      )
                    },
                (_) =>
                    {AutoRouter.of(context).replace(const HomePageRoute())}));
      },
      builder: (context, state) {
        return Form(
          autovalidateMode: state.showValidationMessage
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          key: formKey,
          child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                const SizedBox(
                  height: 80,
                ),
                SizedBox(
                  height: 80,
                  child: Image.asset(
                    'assets/images/ghp_text_white.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 80),
                Text(
                  "Bitte logge dich ein: ",
                  style: themeData.textTheme.bodyText2,
                ),
                const SizedBox(height: 40),
                TextFormField(
                  cursorColor: Colors.white,
                  decoration: const InputDecoration(labelText: "E-Mail"),
                  validator: validateEmail,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  cursorColor: Colors.white,
                  decoration: const InputDecoration(labelText: "Passwort"),
                  validator: validatePassword,
                ),
                const SizedBox(height: 40),
                CustomButton(
                    buttonText: "Einloggen",
                    callback: () {
                      //AutoRouter.of(context).replace(const HomePageRoute());
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<SigninBloc>(context).add(
                            SignInRequestEvent(
                                email: _email, password: _password));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Invalid input",
                              style: themeData.textTheme.bodyText1,
                            ),
                            backgroundColor: Colors.redAccent,
                          ),
                        );
                      }
                    })
              ]),
        );
      },
    );
  }
}
