import 'package:flutter/material.dart';
import 'package:flutter_marvel_app/core/theme/palette.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Alliance',
        appBarTheme: const AppBarTheme(color: Palette.primary),
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Palette.neutralLightest,
              fontFamily: 'Alliance',
            ),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: Palette.primary,
        ),
      ),
      debugShowCheckedModeBanner: false,
      // navigatorKey: AppNavigator.navigatorKey,
      // onGenerateRoute: AppNavigator.onGenerateRoute,
    );
  }
}
