import 'package:flutter/material.dart';
import 'package:flutter_marvel_app/core/theme/palette.dart';

class HomePage extends StatelessWidget {
  const HomePage._();

  static Page<void> page() => const MaterialPage<void>(child: HomePage._());

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Palette.neutralDarkest,
        body: HomeView(),
      ),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Home'),
    );
  }
}
