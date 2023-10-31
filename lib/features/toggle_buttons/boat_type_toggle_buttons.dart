import 'package:flutter/material.dart';

class BoatTypeToggleButtons extends StatefulWidget {
  const BoatTypeToggleButtons({
    super.key,
    required this.selectedBoat,
    required this.selectedBoatChanged,
  });
  final List<bool> selectedBoat;
  final Function(int) selectedBoatChanged;
  @override
  State<BoatTypeToggleButtons> createState() => _BoatTypeToggleButtonsState();
}

class _BoatTypeToggleButtonsState extends State<BoatTypeToggleButtons> {
  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      tapTargetSize: MaterialTapTargetSize.padded,
      onPressed: (int index) {
        widget.selectedBoatChanged(index);
        setState(() {
          // The button that is tapped is set to true, and the others to false.
          for (int i = 0; i < widget.selectedBoat.length; i++) {
            widget.selectedBoat[i] = i == index;
          }
        });
      },
      borderRadius: BorderRadius.circular(50),
      borderWidth: 4,
      isSelected: widget.selectedBoat,
      children: const <Widget>[
        Icon(Icons.surfing),
        Icon(Icons.sailing),
        Icon(Icons.directions_boat),
      ],
    );
  }
}
