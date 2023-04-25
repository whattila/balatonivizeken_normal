import 'package:balatonivizeken/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  bool gpsEnabled = true;
  double zoom = 10;
  final MaterialStateProperty<Icon?> gpsIcon = MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      // Thumb icon when the switch is selected.
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.share_location);
      }
      return const Icon(Icons.location_off);
    },
  );
  _increaseZoom() {
    return () {
      setState(() {
        zoom += 2;
      });
    };
  }

  _decreaseZoom() {
    return () {
      setState(() {
        zoom -= 2;
      });
    };
  }

  Widget _zoomButton({required Icon icon, required Function() zoomFunction}) {
    return CircleAvatar(
      radius: 28,
      backgroundColor: BalatoniVizekenColors.lightBlack,
      child: IconButton(
        iconSize: 36,
        onPressed: zoomFunction,
        icon: icon,
        color: BalatoniVizekenColors.grey,
      ),
    );
  }

  Widget _gpsSwitchButton(BuildContext context) {
    return Positioned(
      bottom: 10,
      right: 10,
      child: SizedBox(
        width: 100,
        height: 80,
        child: FittedBox(
          fit: BoxFit.fill,
          child: Switch(
            thumbIcon: gpsIcon,
            value: gpsEnabled,
            onChanged: (bool value) {
              setState(() {
                gpsEnabled = value;
              });
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FlutterMap(
          options: MapOptions(
            center: LatLng(46.78, 17.77),
            zoom: zoom,
            interactiveFlags: InteractiveFlag.all - InteractiveFlag.rotate,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'dev.fleaflet.flutter_map.example',
            ),
            MarkerLayer(markers: [
              Marker(
                point: LatLng(46.82, 17.70),
                builder: (context) => const Icon(
                  Icons.person_pin_circle,
                  color: Colors.red,
                  size: 20,
                ),
              ),
              Marker(
                point: LatLng(46.85, 17.80),
                builder: (context) => const Icon(
                  Icons.person_pin_circle,
                  color: Colors.red,
                  size: 20,
                ),
              ),
            ]),
          ],
        ),
        _gpsSwitchButton(context),
        Positioned(
          left: 10,
          bottom: 22,
          child: _zoomButton(icon: const Icon(Icons.add), zoomFunction: _increaseZoom()),
        ),
        Positioned(
          left: 80,
          bottom: 22,
          child: _zoomButton(icon: const Icon(Icons.remove), zoomFunction: _decreaseZoom()),
        ),
        Text(
          zoom.toString(),
          style: const TextStyle(fontSize: 50),
        )
      ],
    );
  }
}
