import 'package:auto_route/auto_route.dart';
import 'package:balatonivizeken/core/colors.dart';
import 'package:balatonivizeken/core/router/router.dart';

import 'package:balatonivizeken/features/landing_screens/widgets/landing_screen_divider.widget.dart';
import 'package:balatonivizeken/features/landing_screens/widgets/landing_screen_text_field.widget.dart';
import 'package:balatonivizeken/features/landing_screens/widgets/landing_screen_wrapper.widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({super.key});

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  Widget _title(BuildContext context) {
    return const Text(
      'Üdv, újra!',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
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

  Widget _forgotPassword(BuildContext context) {
    return GestureDetector(
        child: const Text(
          'Elfelejtett jelszó?',
          textAlign: TextAlign.right,
          style: TextStyle(
            decorationStyle: TextDecorationStyle.solid,
            color: BalatoniVizekenColors.purple,
          ),
        ),
        onTap: () => {context.router.push(ForgotPasswordRoute())});
  }

  void _signIn(BuildContext context, WidgetRef ref) {
    //TODO with providers ref.read(loginProvider.notifier).login(username: _usernameController.text, password: _passwordController.text);
    context.router.push(const DashboardRoute());
  }

  Widget _signInButton(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      child: const Text('Bejelentkezés'),
      onPressed: () {
        _signIn(context, ref);
      },
    );
  }

  Widget _getStarted(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: "Nincs felhasználója? ",
        children: [
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.router.push(const RegisterRoute());
              },
            text: 'Csináljunk egyet!',
            style: const TextStyle(color: BalatoniVizekenColors.purple, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _body(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Spacer(),
        _title(context),
        const SizedBox(height: 16),
        AutofillGroup(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _textField(
                context,
                controller: _usernameController,
                hintText: 'Felhasználónév',
                //TODO hint text
                autofillHints: ['Felhasználónév'],
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16),
              _textField(
                context,
                controller: _passwordController,
                hintText: 'Jelszó',
                //TODO hint text
                autofillHints: ['Jelszó'],
                textInputAction: TextInputAction.done,
                onSubmitted: (value) => _signIn(context, ref),
                obscureText: true,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        _forgotPassword(context),
        const SizedBox(height: 16),
        _signInButton(context, ref),
        const SizedBox(height: 8),
        const LandingScreenDivider(),
        const SizedBox(height: 8),
        _getStarted(context),
        const Spacer(),
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LandingScreensWrapper(isLoading: false, canPop: false, content: _body(context, ref));
  }
}
