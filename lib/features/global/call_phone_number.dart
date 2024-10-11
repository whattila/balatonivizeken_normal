import 'package:balatonivizeken/features/snack/snack.dart';
import 'package:url_launcher/url_launcher.dart';

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