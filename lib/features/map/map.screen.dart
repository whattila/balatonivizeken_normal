import 'package:auto_route/auto_route.dart';
import 'package:balatonivizeken/core/colors.dart';
import 'package:balatonivizeken/features/boat/models/boat/boat_type.enum.dart';
import 'package:balatonivizeken/features/boat/providers/boat/boat.provider.dart';
import 'package:balatonivizeken/features/error_widget/error_widget.dart';
import 'package:balatonivizeken/features/global/progress_indicator.widget.dart';
import 'package:balatonivizeken/features/gps_switch/providers/gps/gps.provider.dart';
import 'package:balatonivizeken/features/map/model/marker/marker.model.dart';
import 'package:balatonivizeken/features/map/providers/boat/boat.provider.dart';
import 'package:balatonivizeken/features/map/providers/markers/markers.provider.dart';
import 'package:balatonivizeken/features/snack/snack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends ConsumerStatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> {
  @override
  void deactivate() {
    ref.read(markersProvider.notifier).cancelTimer();
    super.deactivate();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(markersProvider.notifier).refreshMarkers();
    });
    super.initState();
  }

  double zoom = 10;

  MapController mapController = MapController();
  LatLng currentCenter = LatLng(46.78, 17.77);

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
    final gpsEnabled = ref.watch(gpsEnabledProvider);
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
              final boat = ref.read(boatProvider).value;
              if (boat != null) {
                ref.read(gpsEnabledProvider.notifier).setGpsEnabled(boat.id!, enabled: value);
              } else {
                Snack.show(context, text: 'Mielőtt engedélyezné a helyzetének megosztását, létre kell hoznia egy hajót!');
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _body(BuildContext context, {required List<MarkerDto> markers}) {
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
              markers: markers
                  .map<Marker>(
                    (marker) => Marker(
                      point: LatLng(marker.latitude, marker.longitude),
                      width: 36,
                      height: 36,
                      builder: (context) => IconButton(
                        iconSize: 36,
                        color: BalatoniVizekenColors.lightBlack,
                        icon: const Icon(Icons.person_pin_circle),
                        onPressed: () {
                          _showDropdownDialog(context: context, boatId: marker.id!);
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

  Future<void> _showDropdownDialog({required BuildContext context, required String boatId}) async {
    final boatInfo = ref.watch(boatByIdProvider(id: boatId));
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
          content: boatInfo.when(
            data: (boatInfo) => SingleChildScrollView(
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
                Text("Koordináták: (${boatInfo.latitude.toStringAsFixed(2)},${boatInfo.longitude.toStringAsFixed(2)})"),
              ],
            )),
            error: (_, __) => const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: NetworkErrorWidget(),
            ),
            loading: DoubleBouncIndicator.new,
          ),
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
    final markersData = ref.watch(markersProvider);

    return Stack(
      alignment: Alignment.center,
      children: [
        markersData.when(
          data: (data) => _body(context, markers: data),
          error: (error, stackTrace) => const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: NetworkErrorWidget(),
          ),
          loading: () {
            if (markersData.hasValue) {
              return _body(context, markers: markersData.value!);
            }
            return const SizedBox.shrink();
          },
        ),
        markersData.when(
          data: (_) => const SizedBox.shrink(),
          error: (_, __) => const SizedBox.shrink(),
          loading: DoubleBouncIndicator.new,
        ),
      ],
    );
  }
}
