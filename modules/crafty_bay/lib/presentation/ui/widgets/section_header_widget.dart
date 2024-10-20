import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  SectionHeader({
    super.key,
    required this.header,
    required this.onTap
  });

  final String header;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(header,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w800,
          ),
        ),
        TextButton(
            onPressed: onTap,
            child: const Text("See All")
        ),
      ],
    );
  }
}
