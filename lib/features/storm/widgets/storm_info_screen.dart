import 'package:balatonivizeken/core/colors.dart';
import 'package:balatonivizeken/features/global/widgets/unattached_screen_wrapper.widget.dart';
import 'package:balatonivizeken/features/storm/models/storm.model.dart';
import 'package:balatonivizeken/features/storm/models/storm_degree.enum.dart';
import 'package:flutter/material.dart';

class StormInfoScreen extends StatelessWidget {
  const StormInfoScreen({required this.storm, super.key});

  final StormDto storm;

  @override
  Widget build(BuildContext context) {
    return UnattachedScreensWrapper(isLoading: false, canPop: true, content: StormInfoBody(storm: storm,));
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
        const SizedBox(height: 25.0), // Kis hely az első szöveg alatt
        Text(
          storm.area,
          style: const TextStyle(fontSize: 20.0), // Normál méretű szöveg
        ),
        const SizedBox(height: 12.0), // Kis hely a sorok között
        Text(
          '${storm.timeLeft} perc múlva',
          style: const TextStyle(fontSize: 20.0),
        ),
        const SizedBox(height: 12.0), // Kis hely a sorok között
        Text(
          storm.windDefinition,
          style: const TextStyle(fontSize: 20.0),
        ),
        const SizedBox(height: 12.0), // Kis hely a sorok között
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