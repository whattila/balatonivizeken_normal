import 'package:balatonivizeken/core/colors.dart';
import 'package:balatonivizeken/features/gps_switch/gps_switch.widget.dart';
import 'package:balatonivizeken/features/landing_screens/widgets/landing_screen_text_field.widget.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
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
      'Felhasználói beállítások',
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

  Widget _boatTypeToggleButtons(BuildContext context) {
    return ToggleButtons(
      tapTargetSize: MaterialTapTargetSize.padded,
      onPressed: (int index) {
        setState(() {
          // The button that is tapped is set to true, and the others to false.
          for (int i = 0; i < _selectedBoat.length; i++) {
            _selectedBoat[i] = i == index;
          }
        });
      },
      borderRadius: BorderRadius.circular(50),
      borderWidth: 4,
      isSelected: _selectedBoat,
      children: const <Widget>[
        Icon(Icons.surfing),
        Icon(Icons.sailing),
        Icon(Icons.directions_boat),
      ],
    );
  }

  Widget _saveButton(BuildContext context) {
    return ElevatedButton(
      child: const Text('Bejelentkezés'),
      onPressed: () {
        //TODO _save(context);
      },
    );
  }

  Widget _actionButtons(BuildContext context) {
    return Row(
      children: [
        const GpsSwitch(),
        const Spacer(),
        _boatTypeToggleButtons(context),
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
          _saveButton(context),
        ],
      ),
    );
  }

  Widget _body(BuildContext context) {
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

  @override
  Widget build(BuildContext context) {
    return _body(context);
  }
}
