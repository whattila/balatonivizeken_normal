import 'package:balatonivizeken/features/global/outside_of_dashboard_screen_wrapper.widget.dart';
import 'package:balatonivizeken/features/storm/models/storm.model.dart';
import 'package:flutter/material.dart';

class StormInfoScreen extends StatelessWidget {
  const StormInfoScreen({required this.storm, super.key});

  final StormDto storm;

  @override
  Widget build(BuildContext context) {
    return OutsideOfDashboardScreensWrapper(isLoading: false, canPop: true, content: StormInfoBody(storm: storm,));
  }
}

class StormInfoBody extends StatelessWidget {
  const StormInfoBody({required this.storm, super.key});

  final StormDto storm;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Balra igazított szövegek
      children: [
        Center(
          child: Text(
            'Vihar!',
            style: TextStyle(
              fontSize: 24.0, // Nagyobb betűméret
              fontWeight: FontWeight.bold, // Vastag betűk
            ),
          ),
        ),
        SizedBox(height: 20.0), // Kis hely az első szöveg alatt
        Text(
          'Zánka',
          style: TextStyle(fontSize: 16.0), // Normál méretű szöveg
        ),
        SizedBox(height: 8.0), // Kis hely a sorok között
        Text(
          storm.windDefinition,
          style: TextStyle(fontSize: 16.0),
        ),
        SizedBox(height: 8.0), // Kis hely a sorok között
        Text(
          storm.instruction,
          style: TextStyle(
            fontSize: 16.0, // Nagyobb betűméret
            fontWeight: FontWeight.bold, // Vastag betűk
          ),
        ),
      ],
    );
  }
}