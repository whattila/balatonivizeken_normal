import 'package:balatonivizeken/features/gps_switch/providers/gps/gps.provider.dart';
import 'package:balatonivizeken/features/gps_switch/providers/location/location.provider.dart';
import 'package:balatonivizeken/features/map/providers/geolocation/geolocation.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

class GpsSwitch extends ConsumerStatefulWidget {
  const GpsSwitch({super.key});

  @override
  ConsumerState<GpsSwitch> createState() => _GpsSwitchState();
}

class _GpsSwitchState extends ConsumerState<GpsSwitch> {
  final MaterialStateProperty<Icon?> gpsIcon = MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      // Thumb icon when the switch is selected.
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.share_location);
      }
      return const Icon(Icons.location_off);
    },
  );
  @override
  Widget build(BuildContext context) {
    final gpsEnabled = ref.watch(gpsEnabledProvider);

    return SizedBox(
      width: 100,
      height: 80,
      child: FittedBox(
        fit: BoxFit.fill,
        child: Switch(
          thumbIcon: gpsIcon,
          value: gpsEnabled,
          onChanged: (bool value) async {
            Position? ourPos;
            if (value == true) {
              ourPos = await determinePosition();
              ref.read(locationProvider.notifier).setPosition(ourPos);
            }
            ref.read(gpsEnabledProvider.notifier).setGpsEnabled(null, enabled: value);
          },
        ),
      ),
    );
  }
}
