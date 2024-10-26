import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:urbook/core/routes/page_route_name.dart';
import 'package:urbook/core/widgets/custom_elevated_button.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  final TextEditingController _nameController = TextEditingController();
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

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'please_enter_your_full_name'.tr();
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
            "full_name",
            style: theme.textTheme.bodyLarge,
          ).tr(),
          const SizedBox(height: 8.0),
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: 'full_name'.tr(),
              border: const OutlineInputBorder(),
              hintText: 'enter_your_full_name'.tr(),
            ),
            validator: _validateName,
          ),
          const SizedBox(height: 16.0),
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
          const SizedBox(height: 60.0),
          CustomElevatedButton(
            text: 'create_account',
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Navigator.pushNamed(
                    context, PageRouteName.emailVerificationView);
              }
            },
          ),
        ],
      ),
    );
  }
}
