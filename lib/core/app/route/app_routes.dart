import 'package:flutter/material.dart';
import 'package:flutter_marvel_app/core/app/route/app_route_bloc.dart';
import 'package:flutter_marvel_app/feature/home/presentation/pages/home_page.dart';

List<Page> onGenerateAppViewPages(AppRouteState state, List<Page> pages) {
  switch (state.page) {
    case AppRoutes.home:
      return [HomePage.page()];
    default:
      return [HomePage.page()];
  }
}
