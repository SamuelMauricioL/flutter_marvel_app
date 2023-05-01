import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_marvel_app/core/app/injection_container.dart';
import 'package:flutter_marvel_app/core/theme/palette.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Image.asset(
                "assets/gifs/marvel_intro.gif",
                width: 250.0,
              ),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state.status == HomeStatus.loading) {
                    return const Padding(
                      padding: EdgeInsets.all(50.0),
                      child: Center(
                          child: CircularProgressIndicator(
                        color: Palette.grey,
                      )),
                    );
                  }
                  return HomeCard(heroes: state.heroes);
                },
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
