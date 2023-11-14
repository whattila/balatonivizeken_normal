import 'package:auto_route/auto_route.dart';
import 'package:balatonivizeken/core/colors.dart';
import 'package:balatonivizeken/features/boat/models/boat/boat_type.enum.dart';
import 'package:balatonivizeken/features/boat/providers/boat/boat.provider.dart';
import 'package:balatonivizeken/features/error_widget/error_widget.dart';
import 'package:balatonivizeken/features/global/progress_indicator.widget.dart';
import 'package:balatonivizeken/features/gps_switch/providers/gps/gps.provider.dart';
import 'package:balatonivizeken/features/map/model/marker/marker.model.dart';
import 'package:balatonivizeken/features/map/model/no_go_zone/no_go_zone.model.dart';
import 'package:balatonivizeken/features/map/providers/boat/boat.provider.dart';
import 'package:balatonivizeken/features/map/providers/markers/markers.provider.dart';
import 'package:balatonivizeken/features/map/providers/no_go_zone/no_go_zone.provider.dart';
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

  Widget _body(BuildContext context, {required List<MarkerDto> markers, required List<NoGoZone> noGoZones}) {
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
            PolygonLayer(
              polygons: noGoZones
                  .map<Polygon>(
                    (noGoZone) => Polygon(
                      borderColor: Colors.red,
                      borderStrokeWidth: 3,
                      isDotted: true,
                      color: const Color.fromRGBO(244, 67, 54, 0.2),
                      isFilled: true,
                      points: noGoZone.zonePoints
                          .map<LatLng>(
                            (point) => LatLng(point.latitude, point.longitude),
                          )
                          .toList(),
                    ),
                  )
                  .toList(),
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

  Widget _content(BuildContext context, {required WidgetRef ref, required String boatId}) {
    final boatInfo = ref.watch(boatByIdProvider(id: boatId));

    return boatInfo.when(
      data: (boatInfo) => SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 8,
          ),
          Text(
            "Hajó neve: ${boatInfo.displayName}",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Hajó típusa: ${boatInfo.boatType.displayName} ",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              _getBoatTypeIcon(context, boatType: boatInfo.boatType)
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "Koordináták: (${boatInfo.latitude.toStringAsFixed(2)},${boatInfo.longitude.toStringAsFixed(2)})",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8,
          ),
          if (boatInfo.boatType != BoatType.waterSportsEquipment && boatInfo.boatColor != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "Hajó színe: ",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Container(
                  color: Color(int.parse(boatInfo.boatColor!)),
                  width: 50,
                  height: 30,
                )
              ],
            ),
        ],
      )),
      error: (_, __) => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: NetworkErrorWidget(),
      ),
      loading: () => const DoubleBouncIndicator(),
    );
  }

  Future<void> _showDropdownDialog({required BuildContext context, required String boatId}) async {
    await showDialog<bool?>(
      context: context,
      builder: (context) => Consumer(builder: (context, ref, _) {
        return Padding(
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
            content: _content(context, ref: ref, boatId: boatId),
            actions: [
              TextButton(
                child: const Text('Bezárás'),
                onPressed: () {
                  context.router.pop();
                },
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _getBoatTypeIcon(BuildContext context, {required BoatType boatType}) {
    switch (boatType) {
      case BoatType.waterSportsEquipment:
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
    final noGoZoneData = ref.watch(noGoZonesProvider);
    final markersData = ref.watch(markersProvider);
    final items = [noGoZoneData, markersData];

    if (items.every((e) => e.hasValue)) {
      return Stack(
        alignment: Alignment.center,
        children: [
          _body(context, markers: markersData.value!, noGoZones: noGoZoneData.value!),
        ],
      );
    }

    if (items.any((e) => e.hasError)) {
      return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: NetworkErrorWidget(),
      );
    }
    return const DoubleBouncIndicator();
  }
}
