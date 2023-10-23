import 'package:auto_route/auto_route.dart';
import 'package:balatonivizeken/core/colors.dart';
import 'package:balatonivizeken/features/boat/models/boat/boat.model.dart';
import 'package:balatonivizeken/features/boat/models/boat/boat_type.enum.dart';
import 'package:balatonivizeken/features/boat/providers/boat/boat.provider.dart';
import 'package:balatonivizeken/features/error_widget/error_widget.dart';
import 'package:balatonivizeken/features/global/progress_indicator.widget.dart';
import 'package:balatonivizeken/features/gps_switch/gps_switch.widget.dart';
import 'package:balatonivizeken/features/gps_switch/providers/location/location.provider.dart';
import 'package:balatonivizeken/features/landing_screens/widgets/landing_screen_text_field.widget.dart';
import 'package:balatonivizeken/features/toggle_buttons/boat_type_toggle_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BoatScreen extends ConsumerStatefulWidget {
  const BoatScreen({super.key});

  @override
  ConsumerState<BoatScreen> createState() => _BoatScreenState();
}

class _BoatScreenState extends ConsumerState<BoatScreen> {
  final List<bool> _selectedBoat = <bool>[false, false, true];
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

  Widget _saveButton(BuildContext context) {
    return ElevatedButton(
      child: const Text('Mentés'),
      onPressed: () {
        final boatType = _getBoatTypeFromToggleButtons(context);
        ref.read(updateBoatProvider(boatType: boatType, displayName: _displayNameController.text));
      },
    );
  }

  Widget _boatTypeDialogBody(context) {
    return Column(
      children: [
        const Text("Jelmagyarázat"),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: const [
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
        const SizedBox(
          height: 8,
        ),
        Row(
          children: const [
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
        const SizedBox(
          height: 8,
        ),
        Row(
          children: const [
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

  Widget _actionButtons(BuildContext context) {
    return Row(
      children: [
        const GpsSwitch(),
        const Spacer(),
        BoatTypeToggleButtons(
            selectedBoat: _selectedBoat,
            selectedBoatChanged: (int index) {
              for (int i = 0; i < _selectedBoat.length; i++) {
                _selectedBoat[i] = i == index;
              }
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

  BoatType _getBoatTypeFromToggleButtons(BuildContext context) {
    final index = _selectedBoat.indexWhere((element) => true);
    switch (index) {
      case 0:
        return BoatType.sup;
      case 1:
        return BoatType.smallBoat;
      case 2:
        return BoatType.licensedBoat;
      default:
        return BoatType.sup;
    }
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

  Widget _accountSettings(BuildContext context) {
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
          const SizedBox(height: 24),
          _subTitle(context, subTitle: 'Gps és hajótípus'),
          const Divider(),
          _actionButtons(context),
          const SizedBox(height: 16),
          _subTitle(context, subTitle: 'Koordináták'),
          const SizedBox(height: 16),
          _coordinates(context),
          const SizedBox(height: 16),
          _saveButton(context),
        ],
      ),
    );
  }

  Widget _body(BuildContext context, {required BoatDto? boat}) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _title(context),
          const SizedBox(height: 16),
          _accountSettings(context),
        ],
      ),
    );
  }

  _setSelectedBoat({required BoatType boatType}) {
    switch (boatType) {
      case BoatType.sup:
        _selectedBoat[0] = true;
        _selectedBoat[1] = false;
        _selectedBoat[2] = false;

        break;
      case BoatType.smallBoat:
        _selectedBoat[0] = false;
        _selectedBoat[1] = true;
        _selectedBoat[2] = false;

        break;
      case BoatType.licensedBoat:
        _selectedBoat[0] = false;
        _selectedBoat[1] = false;
        _selectedBoat[2] = true;

        break;
      default:
        _selectedBoat[0] = true;
        _selectedBoat[1] = false;
        _selectedBoat[2] = false;

        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final boatData = ref.watch(boatByUserIdProvider);

    return Stack(
      alignment: Alignment.center,
      children: [
        boatData.when(
          data: (data) {
            if (data != null) {
              _setSelectedBoat(boatType: data.boatType);
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
              return _body(context, boat: boatData.value!);
            }
            return const SizedBox.shrink();
          },
        ),
        boatData.when(
          data: (_) => const SizedBox.shrink(),
          error: (_, __) => const SizedBox.shrink(),
          loading: DoubleBouncIndicator.new,
        ),
      ],
    );
  }
}