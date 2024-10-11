import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../global/outside_of_dashboard_screen_wrapper.widget.dart';
import '../map/providers/markers/sos/sos_markers.provider.dart';
import 'models/sos_alert.model.dart';

class SosInfoScreen extends StatelessWidget {
  const SosInfoScreen({required this.sos, super.key});

  final SosAlertDto sos;

  @override
  Widget build(BuildContext context) {
    return OutsideOfDashboardScreensWrapper(isLoading: false, canPop: true, content: SosInfoBody(sos: sos,));
  }
}

class SosInfoBody extends ConsumerWidget {
  const SosInfoBody({required this.sos, super.key});

  final SosAlertDto sos;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Balra igazított szövegek
      children: [
        Center(
          child: Text(
            'Segélykérés!',
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
          sos.phoneNumber,
          style: TextStyle(fontSize: 16.0),
        ),
        SizedBox(height: 8.0), // Kis hely a sorok között
        Text(
          sos.phoneNumber,
          style: TextStyle(
            fontSize: 16.0, // Nagyobb betűméret
            fontWeight: FontWeight.bold, // Vastag betűk
          ),
        ),
        SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: () {
            ref.read(sosMarkersProvider.notifier).addSos(sos.boatId, sos.lastPositions);
            context.router.pop();
          },
          child: const Text('Térképre helyezés'),
        )
      ],
    );
  }
}