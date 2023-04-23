import 'package:balatonivizeken/features/global/progress_indicator.widget.dart';
import 'package:flutter/material.dart';

class FullPageProgressIndicator extends StatelessWidget {
  const FullPageProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: const DoubleBouncIndicator(),
      ),
    );
  }
}
