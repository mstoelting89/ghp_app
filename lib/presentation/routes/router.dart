import 'package:auto_route/auto_route.dart';
import 'package:ghp_app/presentation/home/home_page.dart';
import 'package:ghp_app/presentation/sign_in/sign_in_page.dart';

@MaterialAutoRouter(
  routes: <AutoRoute> [
    AutoRoute(page: SignInPage, initial: true),
    AutoRoute(page: HomePage, initial: false)
  ]
)

class $AppRouter {}