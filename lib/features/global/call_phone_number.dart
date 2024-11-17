import 'package:balatonivizeken/features/snack/snack.dart';
import 'package:url_launcher/url_launcher.dart';

// TODO test: a launchUrl-t 'tel:[eredeti szám]' alakú paraméterrel hívták-e, akkor is, ha azzal kezdődött, és akkor is, ha nem?
Future<void> callPhoneNumber(String phoneNumber) async {
  if (!phoneNumber.contains('tel:')) {
    phoneNumber = 'tel:$phoneNumber';
  }
  final url = Uri.parse(phoneNumber);
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    Snack.showWithoutContext(text: 'Hiba a telefonszám hívásakor');
  }
}