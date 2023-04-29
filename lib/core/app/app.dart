import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_marvel_app/core/app/route/app_route_bloc.dart';
import 'package:flutter_marvel_app/core/app/route/app_routes.dart';
import 'package:flutter_marvel_app/core/theme/palette.dart';

class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AppRouteBloc()),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

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
      home: FlowBuilder(
        state: context.select((AppRouteBloc bloc) => bloc.state),
        onGeneratePages: onGenerateAppViewPages,
      ),
    );
  }
}
