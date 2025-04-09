import 'package:flutter/material.dart';
import 'package:rick_and_morty_testapp/core/injectable/injectable.dart';
import 'package:rick_and_morty_testapp/core/route/app_router.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: getIt<AppRouter>().defaultRouteParser(),
      routerDelegate: getIt<AppRouter>().delegate(),
    );
  }
}
