import 'package:auto_route/auto_route.dart';
import 'package:balatonivizeken/core/colors.dart';
import 'package:balatonivizeken/core/router/router.dart';
import 'package:balatonivizeken/features/boat/models/user/user.model.dart';
import 'package:balatonivizeken/features/landing_screens/login/providers/login/login.provider.dart';

import 'package:balatonivizeken/features/landing_screens/widgets/landing_screen_divider.widget.dart';
import 'package:balatonivizeken/features/landing_screens/widgets/landing_screen_text_field.widget.dart';
import 'package:balatonivizeken/features/landing_screens/widgets/landing_screen_wrapper.widget.dart';
import 'package:balatonivizeken/features/location_update/providers/location_update.provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rustic/option.dart';
import 'package:rustic/result.dart';

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
    ref.read(loginProvider.notifier).login(username: _usernameController.text, password: _passwordController.text);
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

  void _clearTextFields() {
    _usernameController.clear();
    _passwordController.clear();
  }

  bool _isLoading({required Option<Result<Option<UserDto>, Object>> login}) {
    return login.matchSync(
      (value) => value.matchSync(
        (option) => option.matchSync(
          (userDto) => false,
          () => true,
        ),
        (error) => false,
      ),
      () => false,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(loginProvider, (_, next) {
      next.match(
        (value) => value.match(
          (option) => option.match(
            (userDto) {
              _clearTextFields();
              ref.read(locationUpdateProvider.notifier).startLocationUpdate();
              context.router.replaceAll([const DashboardRoute()]);
            },
            () => null,
          ),
          (error) => _clearTextFields(),
        ),
        () => null,
      );
    });

    final login = ref.watch(loginProvider);
    return LandingScreensWrapper(isLoading: _isLoading(login: login), canPop: false, content: _body(context, ref));
  }
}
