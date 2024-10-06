import 'package:balatonivizeken/core/colors.dart';
import 'package:balatonivizeken/features/landing_screens/widgets/landing_screen_text_field.widget.dart';
import 'package:balatonivizeken/features/global/outside_of_dashboard_screen_wrapper.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForgotPasswordScreen extends ConsumerWidget {
  ForgotPasswordScreen({super.key});

  final _emailController = TextEditingController();

  Widget _title(BuildContext context) {
    return const Text(
      'Elfelejtette jelszavát?',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
    );
  }

  Widget _subtitle(BuildContext context) {
    return const Text(
      'Írja be az email-címét, és máris küldjük a jelszó visszaállításhoz szükséges lépéseket!',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 14),
    );
  }

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

  void _forgotPassword(BuildContext context, WidgetRef ref) {
    //TODO with providers
  }

  Widget _forgotPasswordButton(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      child: const Text('Küldés'),
      onPressed: () {
        _forgotPassword(context, ref);
      },
    );
  }

  Widget _body(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Spacer(),
        _title(context),
        const SizedBox(height: 16),
        _subtitle(context),
        const SizedBox(height: 16),
        const Divider(color: BalatoniVizekenColors.lightGrey),
        const SizedBox(height: 16),
        _textField(
          context,
          controller: _emailController,
          hintText: 'Email-cím',
          //TODO hint text
          autofillHints: ['Email-cím'],
          textInputAction: TextInputAction.done,
        ),
        const SizedBox(height: 16),
        _forgotPasswordButton(context, ref),
        const Spacer(),
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OutsideOfDashboardScreensWrapper(isLoading: false, canPop: true, content: _body(context, ref));
  }
}
