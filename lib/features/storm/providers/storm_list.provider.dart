import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/storm.model.dart';

part 'storm_list.provider.g.dart';

@riverpod // keepAlive: true ?
class StormList extends _$StormList {
  @override
  List<StormDto> build() => <StormDto>[];

  void addStormToList(StormDto storm) {
    state.add(storm);
  }
}