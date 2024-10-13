import 'package:balatonivizeken/core/colors.dart';
import 'package:balatonivizeken/features/global/widgets/outside_of_dashboard_screen_wrapper.widget.dart';
import 'package:balatonivizeken/features/storm/models/storm.model.dart';
import 'package:balatonivizeken/features/storm/models/storm_degree.enum.dart';
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
            storm.degree.displayName,
            style: TextStyle(
              fontSize: 30.0, // Nagyobb betűméret
              fontWeight: FontWeight.bold,
              color: _getStormDegreeColor(storm.degree)
            ),
          ),
        ),
        SizedBox(height: 25.0), // Kis hely az első szöveg alatt
        Text(
          storm.area,
          style: TextStyle(fontSize: 20.0), // Normál méretű szöveg
        ),
        SizedBox(height: 12.0), // Kis hely a sorok között
        Text(
          '${storm.timeLeft} perc múlva',
          style: TextStyle(fontSize: 20.0),
        ),
        SizedBox(height: 12.0), // Kis hely a sorok között
        Text(
          storm.windDefinition,
          style: TextStyle(fontSize: 20.0),
        ),
        SizedBox(height: 12.0), // Kis hely a sorok között
        Text(
          storm.instruction,
          style: TextStyle(
            fontSize: 20.0, // Nagyobb betűméret
            fontWeight: FontWeight.bold, // Vastag betűk
            color: _getStormDegreeColor(storm.degree)
          ),
        ),
      ],
    );
  }

  Color _getStormDegreeColor(StormDegree stormDegree) {
    switch (stormDegree) {
      case StormDegree.basic:
        return BalatoniVizekenColors.white;
      case StormDegree.first:
        return BalatoniVizekenColors.orange;
      case StormDegree.second:
        return BalatoniVizekenColors.red;
    }
  }
}