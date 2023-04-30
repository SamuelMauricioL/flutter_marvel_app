import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_marvel_app/core/app/injection_container.dart';
import 'package:flutter_marvel_app/core/widgets/marvel_scaffold.dart';
import 'package:flutter_marvel_app/feature/home/presentation/bloc/home_bloc.dart';
import 'package:flutter_marvel_app/feature/home/presentation/widgets/home_card.dart';

class HomePage extends StatelessWidget {
  const HomePage._();

  static Page<void> page() => const MaterialPage<void>(child: HomePage._());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<HomeBloc>()..add(const GetListHeroes()),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MarvelScaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.status == HomeStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          return const HomeCard();
        },
      ),
    );
  }
}
