import 'package:flutter/material.dart';
import 'package:flutter_marvel_app/core/theme/marvel_text_style.dart';

class DetailDescription extends StatelessWidget {
  final String description;
  const DetailDescription({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text('Descripción', style: MarvelTextStyle.subtitle),
        const SizedBox(height: 10),
        Text(
          description.isEmpty ? 'No hay descripción' : description,
          style: MarvelTextStyle.paragraph,
        ),
      ],
    );
  }
}
