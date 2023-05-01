import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_marvel_app/core/app/route/app_route_bloc.dart';
import 'package:flutter_marvel_app/feature/home/presentation/widgets/home_card_scroll.dart';
import 'package:flutter_marvel_app/feature/home/domain/entities/hero_entity.dart';

class HomeCard extends StatefulWidget {
  final List<HeroEntity> heroes;
  const HomeCard({required this.heroes, super.key});

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  late double currentPage;
  late PageController controller;

  @override
  void initState() {
    currentPage = widget.heroes.length - 1.0;
    controller = PageController(initialPage: widget.heroes.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page ?? 0;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final index = (controller.page!).round();
        final heroId = widget.heroes[index].id.toString();

        context.read<AppRouteBloc>().add(
              ChangedTo(
                page: AppRoutes.detail,
                arguments: heroId,
              ),
            );
      },
      child: Stack(
        children: <Widget>[
          HomeCardScroll(
            heroes: widget.heroes,
            currentPage: currentPage,
          ),
          Positioned.fill(
            child: PageView.builder(
              itemCount: widget.heroes.length,
              controller: controller,
              reverse: true,
              itemBuilder: (context, index) => const SizedBox.shrink(),
            ),
          ),
        ],
      ),
    );
  }
}
