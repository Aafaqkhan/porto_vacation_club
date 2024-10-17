import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:porto_vacation_club/presentation/views/dummy_screen.dart';
import 'package:porto_vacation_club/shared/theme/light_theme.dart';
import 'di/di.dart';
import 'shared/navigation/navigator_key.dart';
import 'shared/navigation/route_generator.dart';
import 'providers/localization_provider.dart';
import 'providers/theme_provider.dart';
import 'shared/app_persistance/app_local.dart';
import 'shared/localization/app_localization.dart';
import 'shared/theme/dark_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppLocal.ins.initStorage();
  await DI.initDI();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ref.watch(themeProvider),
      theme: lightTheme,
      darkTheme: darkTheme,
      supportedLocales: AppLocalization.supportedLocales,
      locale: ref.watch(localizationProvider),
      localizationsDelegates: const [
        AppLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      navigatorKey: navigatorKey,
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: DummyScreen.routeName,
    );
  }
}
