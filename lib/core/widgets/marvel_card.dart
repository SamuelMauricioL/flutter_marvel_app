import 'package:flutter/material.dart';

class MarvelCard extends StatelessWidget {
  final double aspectRatio;
  final double borderRadiusCircular;
  final Widget child;

  const MarvelCard({
    required this.aspectRatio,
    this.borderRadiusCircular = 16.0,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadiusCircular),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(3.0, 6.0),
              blurRadius: 10.0,
            )
          ],
        ),
        child: AspectRatio(
          aspectRatio: aspectRatio,
          child: child,
        ),
      ),
    );
  }
}
