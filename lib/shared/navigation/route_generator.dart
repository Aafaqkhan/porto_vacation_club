import 'package:flutter/material.dart';
import '../../presentation/views/dummy_screen.dart';
import 'screen_params.dart';

class RouteGenerator {
  static Route generateRoute(RouteSettings settings) => switch (settings.name) {
        DummyScreen.routeName =>
          route(DummyScreen(params: settings.arguments as DummyScreenArgs?)),
        _ => route(const ErrorRoute()),
      };
}

Route route(Widget screen) => MaterialPageRoute(builder: (context) => screen);

class ErrorRoute extends StatelessWidget {
  const ErrorRoute({super.key});

  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('You should not be here...')));
}
