import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String id;
  const DetailPage._(this.id);

  static Page<void> page(String id) =>
      MaterialPage<void>(child: DetailPage._(id));

  @override
  Widget build(BuildContext context) {
    print('=====> $id');
    return const DetailView();
  }
}

class DetailView extends StatelessWidget {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
    );
  }
}
