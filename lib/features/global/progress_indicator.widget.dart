import 'package:balatonivizeken/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DoubleBouncIndicator extends StatelessWidget {
  const DoubleBouncIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const SpinKitDoubleBounce(
      color: BalatoniVizekenColors.purple,
      size: 64,
    );
  }
}
