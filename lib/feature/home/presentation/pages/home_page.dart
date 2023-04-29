import 'package:flutter/material.dart';
import 'package:flutter_marvel_app/core/widgets/marvel_scaffold.dart';
import 'package:flutter_marvel_app/feature/home/presentation/widgets/home_card.dart';

class HomePage extends StatelessWidget {
  const HomePage._();

  static Page<void> page() => const MaterialPage<void>(child: HomePage._());

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MarvelScaffold(
      body: HomeCard(),
    );
  }
}
