import 'package:auto_route/auto_route.dart';
import 'package:balatonivizeken/core/router/router.dart';
import 'package:balatonivizeken/features/boat/models/user/user.model.dart';
import 'package:balatonivizeken/features/landing_screens/login/providers/login/login.provider.dart';
import 'package:balatonivizeken/features/landing_screens/register/models/registration/registration.model.dart';
import 'package:balatonivizeken/features/landing_screens/register/providers/register/register.provider.dart';
import 'package:balatonivizeken/features/landing_screens/user_type.enum.dart';
import 'package:balatonivizeken/features/landing_screens/widgets/landing_screen_text_field.widget.dart';
import 'package:balatonivizeken/features/global/outside_of_dashboard_screen_wrapper.widget.dart';
import 'package:balatonivizeken/features/snack/snack.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rustic/option.dart';
import 'package:rustic/result.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _familyNameController = TextEditingController();

  final _givenNameController = TextEditingController();

  final _usernameController = TextEditingController();

  final _emailController = TextEditingController();

  final _phoneNumberController = TextEditingController();

  final _passwordController = TextEditingController();

  final _confirmPasswordController = TextEditingController();

  final _invitationCodeController = TextEditingController();

  bool _validate(TextEditingController controller) {
    return controller.text.isNotEmpty;
  }

  bool get _isValid {
    final validations = [
      _validate(_familyNameController),
      _validate(_givenNameController),
      _validate(_usernameController),
      _validate(_emailController),
      _validate(_phoneNumberController),
      _validate(_passwordController),
      _validate(_confirmPasswordController),
      _validate(_invitationCodeController)
    ];
    return validations.every((isValid) => isValid);
  }

  Widget _title(BuildContext context) {
    return const Text(
      "Regisztráció",
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
      onChanged: (value) => setState(() {}),
      onSubmitted: onSubmitted,
      labelTextSuffix: ' *',
    );
  }

  bool _passwordsMatch(BuildContext context) {
    return _passwordController.text == _confirmPasswordController.text;
  }

  void _register(BuildContext context) {
    if (!_passwordsMatch(context)) {
      Snack.show(context, text: "A jelszavak nem egyeznek");
      return;
    }
    ref.read(registerProvider.notifier).register(
          registrationDto: RegistrationDto(
            username: _usernameController.text,
            familyName: _familyNameController.text,
            givenName: _givenNameController.text,
            emailAddress: _emailController.text,
            phoneNumber: _phoneNumberController.text,
            password: _passwordController.text,
            userType: UserType.lifeguard,
            invitationCode: _invitationCodeController.text
          ),
        );
  }

  Widget _registerButton(BuildContext context) {
    return ElevatedButton(
      onPressed: _isValid ? () => _register(context) : null,
      child: const Text('Regisztrálás'),
    );
  }

  Widget _termsAndConditions(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'A folytatással beleegyezel a következőkbe ',
        children: [
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                //TODO webview or different page or popup
              },
            text: 'Általános Szerződési Feltételek',
            style: const TextStyle(decoration: TextDecoration.underline),
          ),
          const TextSpan(
            text: ' és ',
            style: TextStyle(),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                //TODO webview or different page or popup
              },
            text: 'Adatvédelmi nyilatkozat',
            style: const TextStyle(decoration: TextDecoration.underline),
          ),
        ],
      ),
    );
  }

  Widget _body(BuildContext context) {
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
              const SizedBox(height: 8),
              _textField(
                context,
                controller: _familyNameController,
                hintText: 'Vezetéknév',
                //TODO hint text
                autofillHints: ['Vezetéknév'],
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16),
              _textField(
                context,
                controller: _givenNameController,
                hintText: 'Keresztnév',
                //TODO hint text
                autofillHints: ['Keresztnév'],
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16),
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
                controller: _emailController,
                hintText: 'Email-cím',
                //TODO hint text
                autofillHints: ['Email-cím'],
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16),
              _textField(
                context,
                controller: _phoneNumberController,
                hintText: 'Telefonszám',
                //TODO hint text
                autofillHints: ['Telefonszám'],
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16),
              _textField(
                context,
                controller: _passwordController,
                hintText: 'Jelszó',
                //TODO hint text
                autofillHints: ['Jelszó'],
                textInputAction: TextInputAction.next,
                obscureText: true,
              ),
              const SizedBox(height: 16),
              _textField(
                context,
                controller: _confirmPasswordController,
                hintText: 'Jelszó megerősítés',
                //TODO hint text
                autofillHints: ['Jelszó megerősítés'],
                textInputAction: TextInputAction.next,
                obscureText: true,
              ),
              const SizedBox(height: 16),
              _textField(
                context,
                controller: _invitationCodeController,
                hintText: 'Ellenőrző kód',
                //TODO hint text
                autofillHints: ['Vizimentőként kapott ellenőrző kód'],
                textInputAction: TextInputAction.done,
                onSubmitted: (_) {
                  if (_isValid) {
                    _register(context);
                  }
                },
                obscureText: true,
              ),
              const SizedBox(height: 16),
              _termsAndConditions(context),
            ],
          ),
        ),
        const SizedBox(height: 16),
        _registerButton(context),
        const Spacer(),
      ],
    );
  }

  bool _isLoading({
    required Option<Result<Option<void>, Object>> register,
    required Option<Result<Option<UserDto>, Object>> login,
  }) {
    final loginLoading = login.matchSync(
      (value) => value.matchSync(
        (option) => option.matchSync(
          (userDto) => false,
          () => true,
        ),
        (error) => false,
      ),
      () => false,
    );
    final registerLoading = register.matchSync(
      (value) => value.matchSync(
        (option) => option.matchSync(
          (userDto) => false,
          () => true,
        ),
        (error) => false,
      ),
      () => false,
    );

    return loginLoading || registerLoading;
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(registerProvider, (_, next) {
      next.match(
        (value) => value.match(
          (option) => option.match(
            (_) {
              Snack.show(context, text: 'Sikeres regisztráció! Jelentkezzen be a létrehozott felhasználójával!');
              context.router.replaceAll([LoginRoute()]);
            },
            () => null,
          ),
          (error) {
            if (!_passwordsMatch(context)) {
              _passwordController.clear();
              _confirmPasswordController.clear();
            }
            else {
              _invitationCodeController.clear();
            }
          },
        ),
        () => null,
      );
    });

    final register = ref.watch(registerProvider);
    final login = ref.watch(loginProvider);
    return OutsideOfDashboardScreensWrapper(
      isLoading: _isLoading(register: register, login: login),
      canPop: true,
      content: _body(context),
    );
  }
}
