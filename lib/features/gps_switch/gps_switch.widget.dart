import 'package:balatonivizeken/features/map/providers/geolocation/geolocation.provider.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GpsSwitch extends StatefulWidget {
  const GpsSwitch({super.key});

  @override
  State<GpsSwitch> createState() => _GpsSwitchState();
}

class _GpsSwitchState extends State<GpsSwitch> {
  bool gpsEnabled = false;
  Position? ourPosition;
  @override
  void initState() {
    if (gpsEnabled) {
      _locate();
    }
    super.initState();
  }

  void _locate() async {
    ourPosition = await determinePosition();
  }

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
            }
            setState(() {
              gpsEnabled = value;
              ourPosition = ourPos;
            });
          },
        ),
      ),
    );
  }
}
