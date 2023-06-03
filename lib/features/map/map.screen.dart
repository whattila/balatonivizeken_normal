import 'package:auto_route/auto_route.dart';
import 'package:balatonivizeken/core/colors.dart';
import 'package:balatonivizeken/features/boat/models/boat/boat.model.dart';
import 'package:balatonivizeken/features/boat/models/boat/boat_type.enum.dart';
import 'package:balatonivizeken/features/error_widget/error_widget.dart';
import 'package:balatonivizeken/features/global/progress_indicator.widget.dart';
import 'package:balatonivizeken/features/map/providers/boats/boats.provider.dart';
import 'package:balatonivizeken/features/map/providers/geolocation/geolocation.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends ConsumerStatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> {
  bool gpsEnabled = false;
  double zoom = 10;
  Position? ourPosition;
  MapController mapController = MapController();
  LatLng currentCenter = LatLng(46.78, 17.77);

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
  _increaseZoom() {
    return () {
      zoom = zoom + 2 > 18 ? 18 : zoom + 2;
      mapController.move(currentCenter, zoom);
    };
  }

  _decreaseZoom() {
    return () {
      zoom = zoom - 2 < 0 ? 0 : zoom - 2;
      mapController.move(currentCenter, zoom);
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
      ),
    );
  }

  Widget _body(BuildContext context, {required List<BoatDto> boats}) {
    return Stack(
      children: [
        FlutterMap(
          mapController: mapController,
          options: MapOptions(
            center: currentCenter,
            zoom: zoom,
            interactiveFlags: InteractiveFlag.all - InteractiveFlag.rotate,
            onPositionChanged: (position, hasGesture) {
              currentCenter = position.center!;
            },
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'dev.fleaflet.flutter_map.example',
            ),
            MarkerLayer(
              markers: boats
                  .map<Marker>(
                    (boat) => Marker(
                      point: LatLng(boat.latitude, boat.longitude),
                      builder: (context) => IconButton(
                        iconSize: 36,
                        color: BalatoniVizekenColors.lightBlack,
                        icon: const Icon(Icons.person_pin_circle),
                        onPressed: () {
                          _showDropdownDialog(context: context, boatInfo: boat);
                        },
                      ),
                    ),
                  )
                  .toList(),
            ),
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
      ],
    );
  }

  Future<void> _showDropdownDialog({required BuildContext context, required BoatDto boatInfo}) async {
    await showDialog<bool?>(
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: AlertDialog(
          // scrollable: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Hajó adatai",
                overflow: TextOverflow.fade,
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          content: SingleChildScrollView(
              child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    boatInfo.displayName,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  _getBoatTypeIcon(context, boatType: boatInfo.boatType)
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Text("Koordináták: (${boatInfo.latitude},${boatInfo.longitude})"),
            ],
          )),
          actions: [
            TextButton(
              child: const Text('Bezárás'),
              onPressed: () {
                context.router.pop();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _getBoatTypeIcon(BuildContext context, {required BoatType boatType}) {
    switch (boatType) {
      case BoatType.sup:
        return const Icon(Icons.surfing);
      case BoatType.smallBoat:
        return const Icon(Icons.sailing);
      case BoatType.licensedBoat:
        return const Icon(Icons.directions_boat);
      default:
        return const Icon(Icons.surfing);
    }
  }

  @override
  Widget build(BuildContext context) {
    final boatsData = ref.watch(boatsProvider);

    return Stack(
      alignment: Alignment.center,
      children: [
        boatsData.when(
          data: (data) => _body(context, boats: data),
          error: (error, stackTrace) => const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: NetworkErrorWidget(),
          ),
          loading: () {
            if (boatsData.hasValue) {
              return _body(context, boats: boatsData.value!);
            }
            return const SizedBox.shrink();
          },
        ),
        boatsData.when(
          data: (_) => const SizedBox.shrink(),
          error: (_, __) => const SizedBox.shrink(),
          loading: DoubleBouncIndicator.new,
        ),
      ],
    );
  }
}
