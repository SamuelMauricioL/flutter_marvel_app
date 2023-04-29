// ignore_for_file: constant_identifier_names

import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_marvel_app/feature/home/presentation/pages/home_page.dart';

enum Routes {
  HOME,
  COMICS,
  EVENTS,
  SERIES,
  STORIES,
}

class _Paths {
  static const String init = '/';
  static const String home = '/home';
  static const String comics = '/comics';
  static const String events = '/events';
  static const String series = '/series';
  static const String stories = '/stories';

  static const Map<Routes, String> _pathMap = {
    Routes.HOME: _Paths.home,
    Routes.COMICS: _Paths.comics,
    Routes.EVENTS: _Paths.events,
    Routes.SERIES: _Paths.series,
    Routes.STORIES: _Paths.stories,
  };

  static String? of(Routes route) => _pathMap[route];
}

class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Route onGenerateRoute(RouteSettings settings) {
    Route pageRoute({Widget page = const HomePage()}) {
      return Platform.isIOS
          ? CupertinoPageRoute(builder: (context) => page)
          : MaterialPageRoute(builder: (context) => page);
    }

    switch (settings.name) {
      case _Paths.init:
        return pageRoute(page: const HomePage());
      case _Paths.home:
        return pageRoute(page: const HomePage());
      default:
        return pageRoute(page: const HomePage());
    }
  }

  static Future push<T>(Routes route, [T? arguments]) =>
      state.pushNamed(_Paths.of(route)!, arguments: arguments);

  static Future pushNamedAndRemoveUntil<T>(Routes route, [T? arguments]) =>
      state.pushNamedAndRemoveUntil(
        _Paths.of(route)!,
        (Route routes) => false,
        arguments: arguments,
      );

  static Future replaceWith<T>(Routes route, [T? arguments]) =>
      state.pushReplacementNamed(_Paths.of(route)!, arguments: arguments);

  static void pop() => state.pop();

  static void popWithResult<T>(T res) => state.pop(res);

  static NavigatorState get state => navigatorKey.currentState!;
}
