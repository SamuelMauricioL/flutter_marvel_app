import 'package:flutter/material.dart';

class MarvelHoverEfect extends StatefulWidget {
  final Widget child;
  const MarvelHoverEfect({required this.child, super.key});

  @override
  State<MarvelHoverEfect> createState() => _MarvelHoverEfectState();
}

class _MarvelHoverEfectState extends State<MarvelHoverEfect> {
  bool isHover = false;
  Offset mousePosition = const Offset(0, 0);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) {
        setState(() {
          isHover = true;
        });
      },
      onHover: (e) {
        setState(() {
          mousePosition += e.delta;
          mousePosition *= 0.12;
        });
      },
      onExit: (e) {
        setState(() {
          isHover = false;
        });
      },
      child: Stack(
        children: [
          MarvelAnimatedPosition(
            ishover: isHover,
            mousePosition: mousePosition,
            child: widget.child,
          ),
        ],
      ),
    );
  }
}

class MarvelAnimatedPosition extends StatelessWidget {
  final bool ishover;
  final Offset mousePosition;
  final Widget child;
  const MarvelAnimatedPosition({
    required this.ishover,
    required this.mousePosition,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeOutQuint,
      top: ishover ? -40 + mousePosition.dy : 0,
      left: ishover ? -100 + mousePosition.dx : -100,
      height: ishover ? 150 : 100,
      width: 100,
      child: child,
    );
  }
}

class MarvelGradient extends StatelessWidget {
  final bool isHover;
  const MarvelGradient({required this.isHover, super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeOutQuint,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topRight,
          colors: [
            Colors.black.withOpacity(isHover ? 0.8 : 0.0),
            Colors.transparent,
          ],
        ),
      ),
    );
  }
}
