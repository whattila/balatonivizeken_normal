import 'package:balatonivizeken/features/boat/models/boat/boat_type.enum.dart';
import 'package:flutter/material.dart';

class BoatTypeToggleButtons extends StatefulWidget {
  const BoatTypeToggleButtons({
    super.key,
    required this.selectedBoatType,
    required this.selectedBoatChanged,
  });
  final BoatType selectedBoatType;
  final Function(int) selectedBoatChanged;
  @override
  State<BoatTypeToggleButtons> createState() => _BoatTypeToggleButtonsState();
}

class _BoatTypeToggleButtonsState extends State<BoatTypeToggleButtons> {
  final List<bool> _selectedBoat = <bool>[false, false, true];

  void _setSelectedBoat({required BoatType boatType}) {
    switch (boatType) {
      case BoatType.waterSportsEquipment:
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
    _setSelectedBoat(boatType: widget.selectedBoatType);
    return ToggleButtons(
      tapTargetSize: MaterialTapTargetSize.padded,
      onPressed: (int index) {
        widget.selectedBoatChanged(index);
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
}
