import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_marvel_app/core/app/injection_container.dart';
import 'package:flutter_marvel_app/feature/detail/presentation/bloc/detail_bloc.dart';
import 'package:flutter_marvel_app/feature/detail/presentation/widgets/detail_app_bar.dart';
import 'package:flutter_marvel_app/feature/detail/presentation/widgets/detail_card_section.dart';
import 'package:flutter_marvel_app/feature/detail/presentation/widgets/detail_description.dart';
import 'package:flutter_marvel_app/feature/home/domain/entities/hero_entity.dart';

class DetailPage extends StatelessWidget {
  final HeroEntity hero;
  const DetailPage._(this.hero);

  static Page<void> page(HeroEntity hero) =>
      MaterialPage<void>(child: DetailPage._(hero));

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<DetailBloc>()
        ..add(GetComics(hero.id.toString()))
        ..add(GetEvents(hero.id.toString()))
        ..add(GetSeries(hero.id.toString())),
      child: DetailView(hero: hero),
    );
  }
}

class DetailView extends StatefulWidget {
  final HeroEntity hero;
  const DetailView({required this.hero, super.key});

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  bool lastStatus = true;
  final ScrollController _scrollController = ScrollController();
  final double _sliverAppHeight = 400;

  bool get _isShrink {
    return _scrollController.hasClients &&
        _scrollController.offset > (_sliverAppHeight - kToolbarHeight);
  }

  Future<void> _scrollListener() async {
    if (_isShrink != lastStatus) {
      setState(() {
        lastStatus = _isShrink;
      });
    }
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, _) {
          return [
            DetailAppBar(
              sliverAppHeight: _sliverAppHeight,
              hero: widget.hero,
              isShrink: _isShrink,
            ),
          ];
        },
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              DetailDescription(description: widget.hero.description),
              const SizedBox(height: 20),
              BlocBuilder<DetailBloc, DetailState>(builder: (context, state) {
                if (state.status == DetailStatus.loading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return DetailCardSection(title: 'Comics', detail: state.comics);
              }),
              const SizedBox(height: 20),
              BlocBuilder<DetailBloc, DetailState>(builder: (context, state) {
                if (state.status == DetailStatus.loading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return DetailCardSection(title: 'Events', detail: state.events);
              }),
              const SizedBox(height: 20),
              BlocBuilder<DetailBloc, DetailState>(builder: (context, state) {
                if (state.status == DetailStatus.loading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return DetailCardSection(title: 'Series', detail: state.series);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
