import 'package:flutter/material.dart';

class CardProfile extends StatelessWidget {
  const CardProfile({
    super.key,
    required this.children,
    this.paddingTop = 15,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.padding,
  });

  final List<Widget> children;
  final double paddingTop;
  final CrossAxisAlignment crossAxisAlignment;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        margin: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Padding(
          padding:
              padding ?? const EdgeInsets.all(15).copyWith(top: paddingTop),
          child: Column(
            crossAxisAlignment: crossAxisAlignment,
            children: children,
          ),
        ),
      ),
    );
  }
}
