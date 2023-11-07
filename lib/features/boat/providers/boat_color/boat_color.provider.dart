import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'boat_color.provider.g.dart';

@Riverpod(keepAlive: true)
class BoatColor extends _$BoatColor {
  @override
  Color build() {
    return const Color(0xffffffff);
  }

  void setBoatcolor(Color color) {
    state = color;
  }
}
