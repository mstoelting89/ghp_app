import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghp_app/application/news/news_bloc.dart';
import 'package:ghp_app/presentation/home/home_page.dart';
import 'package:ghp_app/presentation/sign_in/sign_in_page.dart';
import 'package:ghp_app/theme.dart';
import 'package:ghp_app/presentation/routes/router.gr.dart' as r;
import 'injection.dart' as di;
import 'injection.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = r.AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Guitar Hearts Project',
        theme: AppTheme.lightTheme,
        themeMode: ThemeMode.light,
        routeInformationParser: _appRouter.defaultRouteParser(),
        routerDelegate: _appRouter.delegate()
    );
    /*
    return MaterialApp(
      title: 'Guitar Hearts Project',
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      home: const SignInPage()
    ); */
  }
}


