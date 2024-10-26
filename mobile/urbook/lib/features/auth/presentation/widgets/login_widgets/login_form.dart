import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:urbook/core/routes/page_route_name.dart';
import 'package:urbook/core/themes/color_palette.dart';
import 'package:urbook/core/widgets/custom_elevated_button.dart';

class LogInForm extends StatefulWidget {
  const LogInForm({super.key});

  @override
  _LogInFormState createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'please_enter_an_email'.tr();
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'please_enter_a_valid_email'.tr();
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'please_enter_a_password'.tr();
    }
    if (value.length < 6) {
      return 'password_must_be_at_least_6_characters_long'.tr();
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "email",
            style: theme.textTheme.bodyLarge,
          ).tr(),
          const SizedBox(height: 8.0),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'email'.tr(),
              border: const OutlineInputBorder(),
              hintText: 'enter_your_email'.tr(),
            ),
            validator: _validateEmail,
          ),
          const SizedBox(height: 16.0),
          Text(
            "password",
            style: theme.textTheme.bodyLarge,
          ).tr(),
          const SizedBox(height: 8.0),
          TextFormField(
            controller: _passwordController,
            obscureText: _obscureText,
            decoration: InputDecoration(
              labelText: 'password'.tr(),
              border: const OutlineInputBorder(),
              hintText: 'enter_your_password'.tr(),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
            ),
            validator: _validatePassword,
          ),
          const SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(
                      context, PageRouteName.emailConfirmationView);
                },
                child: Text(
                  "forgot_password",
                  style: theme.textTheme.bodyLarge!
                      .copyWith(color: LightColorPalette.cyan),
                ).tr(),
              ),
            ],
          ),
          const SizedBox(height: 30.0),
          CustomElevatedButton(
            text: 'login',
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
