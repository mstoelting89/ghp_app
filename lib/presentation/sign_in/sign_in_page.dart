import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghp_app/presentation/sign_in/widgets/sign_in_form.dart';

import '../../application/signin/signin_bloc.dart';
import '../../injection.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => sl<SigninBloc>(),
        child: const SignInForm(),
      ),
    );
  }
}
