import 'package:auto_route/auto_route.dart';
import 'package:balatonivizeken/core/colors.dart';
import 'package:balatonivizeken/features/boat/models/boat/boat.model.dart';
import 'package:balatonivizeken/features/boat/models/boat/boat_type.enum.dart';
import 'package:balatonivizeken/features/boat/providers/boat/boat.provider.dart';
import 'package:balatonivizeken/features/boat/providers/boat_color/boat_color.provider.dart';
import 'package:balatonivizeken/features/error_widget/error_widget.dart';
import 'package:balatonivizeken/features/gps_switch/gps_switch.widget.dart';
import 'package:balatonivizeken/features/gps_switch/providers/location/location.provider.dart';
import 'package:balatonivizeken/features/landing_screens/widgets/landing_screen_text_field.widget.dart';
import 'package:balatonivizeken/features/toggle_buttons/boat_type_toggle_buttons.dart';
import 'package:balatonivizeken/features/toggle_buttons/providers/boat_type.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BoatScreen extends ConsumerStatefulWidget {
  const BoatScreen({super.key});

  @override
  ConsumerState<BoatScreen> createState() => _BoatScreenState();
}

class _BoatScreenState extends ConsumerState<BoatScreen> {
  final _displayNameController = TextEditingController();

  Widget _textField(
    BuildContext context, {
    required TextEditingController controller,
    required String hintText,
    required Iterable<String> autofillHints,
    required TextInputAction textInputAction,
    void Function(String value)? onSubmitted,
    bool obscureText = false,
  }) {
    return LandingScreenTextField(
      controller: controller,
      hintText: hintText,
      autofillHints: autofillHints,
      textInputAction: textInputAction,
      obscureText: obscureText,
      onSubmitted: onSubmitted,
    );
  }

  Widget _title(BuildContext context) {
    return const Text(
      'Hajó beállítások',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }

  Widget _subTitle(BuildContext context, {required String subTitle}) {
    return Text(
      subTitle,
      textAlign: TextAlign.left,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  Widget _saveButton(BuildContext context, BoatDto? boatDto) {
    return ElevatedButton(
      child: Text((boatDto != null) ? 'Hajó adatainak mentése' : 'Új hajó létrehozása'),
      onPressed: () {
        ref.read(boatProvider.notifier).updateBoat(displayName: _displayNameController.text);
      },
    );
  }

  Widget _boatTypeDialogBody(context) {
    return const Column(
      children: [
        Text("Jelmagyarázat"),
        SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Icon(
              Icons.surfing,
              size: 32,
            ),
            Text(":"),
            SizedBox(
              width: 8,
            ),
            SizedBox(
              width: 200,
              child: Text(
                "vizibiciklik, SUP-ok, kajakok, kenuk, stb.  - vízi sporteszközök.",
                style: TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Icon(
              Icons.sailing,
              size: 32,
            ),
            Text(":"),
            SizedBox(
              width: 8,
            ),
            SizedBox(
              width: 200,
              child: Text(
                "kisméretű hajók, minden ami nem sporteszköz, de még nem regisztrációhoz vagy jogosítványhoz kötött.",
                style: TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Icon(
              Icons.directions_boat,
              size: 32,
            ),
            Text(":"),
            SizedBox(
              width: 8,
            ),
            SizedBox(
              width: 200,
              child: Text(
                "regisztrált hajók vagy jogosítvánnyal vezethető hajók.",
                style: TextStyle(fontSize: 12),
              ),
            ),
          ],
        )
      ],
    );
  }

  void _updateBoatType(BuildContext context, int index) {
    switch (index) {
      case 0:
        ref.read(boatTypeProviderProvider.notifier).setBoatType(BoatType.waterSportsEquipment);
        break;
      case 1:
        ref.read(boatTypeProviderProvider.notifier).setBoatType(BoatType.smallBoat);
        break;
      case 2:
        ref.read(boatTypeProviderProvider.notifier).setBoatType(BoatType.licensedBoat);
        break;
      default:
        ref.read(boatTypeProviderProvider.notifier).setBoatType(BoatType.waterSportsEquipment);
        break;
    }
  }

  Widget _actionButtons(BuildContext context, BoatType boatType) {
    return Row(
      children: [
        const GpsSwitch(),
        const Spacer(),
        BoatTypeToggleButtons(
            selectedBoatType: boatType,
            selectedBoatChanged: (int index) {
              _updateBoatType(context, index);
            }),
        IconButton(
          onPressed: () {
            _showDropdownDialog(context: context, title: "Hajó típusok", body: _boatTypeDialogBody(context));
          },
          icon: const Icon(Icons.info_outline),
        )
      ],
    );
  }

  Future<void> _showDropdownDialog({required BuildContext context, required String title, required Widget body}) async {
    await showDialog<bool?>(
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: AlertDialog(
          // scrollable: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                overflow: TextOverflow.fade,
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          content: SingleChildScrollView(child: body),
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

  Widget _coordinatesBody(BuildContext context) {
    return const Text(
      "A koordínáták megjelenítéséhez engedélyezze a gps-t. Ezután az alkalmazás megadja a koordínátáit az eszközének",
      style: TextStyle(fontSize: 14),
    );
  }

  Widget _coordinates(BuildContext context) {
    final position = ref.watch(locationProvider);
    return Row(
      children: [
        IconButton(
            onPressed: () {
              _showDropdownDialog(context: context, title: "Koordínáták", body: _coordinatesBody(context));
            },
            icon: const Icon(Icons.info_outline)),
        Text("Szélesség: ${position.latitude.toStringAsFixed(2)}"),
        const SizedBox(
          width: 16,
        ),
        Text("Hosszúság: ${position.longitude.toStringAsFixed(2)}"),
      ],
    );
  }

  Widget _accountSettings(BuildContext context, BoatDto? boat) {
    final BoatType boatType = ref.watch(boatTypeProviderProvider);
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: BalatoniVizekenColors.lightGrey,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _subTitle(context, subTitle: 'Megjelenített név'),
          const Divider(),
          const SizedBox(height: 16),
          _textField(
            context,
            controller: _displayNameController,
            hintText: 'Megjelenített név',
            //TODO hint text
            autofillHints: ['Megjelenített név'],
            textInputAction: TextInputAction.done,
          ),
          const SizedBox(height: 16),
          _subTitle(context, subTitle: 'Gps és hajótípus'),
          const Divider(),
          _actionButtons(context, boatType),
          const SizedBox(height: 8),
          if (boatType != BoatType.waterSportsEquipment) _colorPicker(context),
          _subTitle(context, subTitle: 'Koordináták'),
          const Divider(),
          _coordinates(context),
          const SizedBox(height: 8),
          _saveButton(context, boat),
        ],
      ),
    );
  }

  Widget _colorPicker(BuildContext context) {
// raise the [showDialog]
    Color boatColor = ref.read(boatColorProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _subTitle(context, subTitle: 'Színválasztó'),
        const Divider(),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                child: const Text('Szín kíválasztása'),
                onPressed: () {
                  showDialog(
                    builder: (context) => AlertDialog(
                      title: const Text('Válassza ki a vízijármű színét!'),
                      content: SingleChildScrollView(
                        child: ColorPicker(
                          pickerColor: boatColor,
                          onColorChanged: (Color color) {
                            boatColor = color;
                            ref.read(boatColorProvider.notifier).setBoatcolor(color);
                          },
                        ),
                      ),
                      actions: <Widget>[
                        ElevatedButton(
                          child: const Text('Megvan'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                    context: context,
                  );
                },
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Container(
              decoration: BoxDecoration(color: boatColor, borderRadius: const BorderRadius.all(Radius.circular(50))),
              width: 50,
              height: 42,
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _body(BuildContext context, {required BoatDto? boat}) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _title(context),
            const SizedBox(height: 16),
            _accountSettings(context, boat),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final boatData = ref.watch(boatProvider);

    return boatData.when(
      data: (data) {
        if (data != null) {
          _displayNameController.text = data.displayName;
        }
        return _body(context, boat: data);
      },
      error: (error, stackTrace) => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: NetworkErrorWidget(),
      ),
      loading: () {
        if (boatData.hasValue) {
          return _body(context, boat: boatData.value);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
