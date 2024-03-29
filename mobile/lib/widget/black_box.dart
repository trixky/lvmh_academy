import 'package:flutter/material.dart';

class BlackBox extends StatelessWidget {
  const BlackBox({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(14),
    ),
    child: child,
  );
}