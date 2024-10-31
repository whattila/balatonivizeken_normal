import 'package:auto_route/auto_route.dart';
import 'package:balatonivizeken/features/boat/models/boat/boat_type.enum.dart';
import 'package:balatonivizeken/features/global/call_phone_number.dart';
import 'package:balatonivizeken/features/map/providers/boat/boat.provider.dart';
import 'package:balatonivizeken/features/map/providers/sos/sos.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/colors.dart';
import '../../boat/models/boat/boat.model.dart';
import '../../error_widget/error_widget.dart';
import '../../global/widgets/progress_indicator.widget.dart';
import '../../global/widgets/unattached_screen_wrapper.widget.dart';
import '../../map/providers/markers/sos/sos_markers.provider.dart';
import '../models/sos_alert.model.dart';
import '../models/sos_header.model.dart';

class SosInfoScreen extends ConsumerWidget {
  const SosInfoScreen({required this.sosHeader, super.key});

  final SosHeaderDto sosHeader;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sos = ref.watch(sosByIdProvider(id: sosHeader.id!));
    final boat = ref.watch(boatByIdProvider(id: sosHeader.boatId));

    if (sos.hasValue && boat.hasValue) {
      return UnattachedScreensWrapper(
          isLoading: false,
          canPop: true,
          content: SosInfoBody(sos: sos.value!, boat: boat.value!,)
      );
    }

    if (sos.hasError || boat.hasError) {
      return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: NetworkErrorWidget(),
      );
    }

    return const DoubleBouncIndicator();
  }
}

class SosInfoBody extends ConsumerWidget {
  const SosInfoBody({required this.sos, required this.boat, super.key});

  final SosAlertDto sos;
  final BoatDto boat;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Balra igazított szövegek
      children: [
        const Center(
          child: Text(
            'Segélykérés!',
            style: TextStyle(
              fontSize: 30.0, // Nagyobb betűméret
              fontWeight: FontWeight.bold, // Vastag betűk
            ),
          ),
        ),
        const SizedBox(height: 25.0), // Kis hely az első szöveg alatt
        Text(
          sos.displayDate,
          style: const TextStyle(fontSize: 20.0), // Normál méretű szöveg
        ),
        const SizedBox(height: 12.0), // Kis hely a sorok között
        Text.rich(
          TextSpan(
            children: [
              const TextSpan(
                text: 'Hajó típusa: ', // Vastag rész
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: boat.boatType.displayName, // Normál rész
                style: const TextStyle(fontWeight: FontWeight.normal),
              ),
            ],
          ),
          style: const TextStyle(fontSize: 20.0),
        ),
        const SizedBox(height: 12.0), // Kis hely a sorok között
        Row(
          mainAxisAlignment: MainAxisAlignment.start, // Középre igazítjuk a sort
          children: [
            const Text(
              "Hajó színe: ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Container(
              color: Color(int.parse(boat.boatColor!)),
              width: 50,
              height: 30,
            ),
          ],
        ),
        const SizedBox(height: 12.0), // Kis hely a sorok között
        GestureDetector(
          child: Text(
            sos.phoneNumber,
            style: const TextStyle(
              color: BalatoniVizekenColors.purple,
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),
          ),
          onTap: () => {callPhoneNumber(sos.phoneNumber)}
        ),
        const SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: () {
            ref.read(sosMarkersProvider.notifier).addSos(sos.id!, sos.lastPositions);
            context.router.pop();
          },
          child: const Text('Térképre helyezés'),
        )
      ],
    );
  }
}