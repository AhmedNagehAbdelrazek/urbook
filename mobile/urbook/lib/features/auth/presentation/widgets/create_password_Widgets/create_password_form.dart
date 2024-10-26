import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:urbook/core/routes/page_route_name.dart';
import 'package:urbook/core/widgets/custom_elevated_button.dart';

class CreatePasswordForm extends StatefulWidget {
  const CreatePasswordForm({super.key});

  @override
  _CreatePasswordFormState createState() => _CreatePasswordFormState();
}

class _CreatePasswordFormState extends State<CreatePasswordForm> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

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
          Text(
            "confirm_password",
            style: theme.textTheme.bodyLarge,
          ).tr(),
          const SizedBox(height: 8.0),
          TextFormField(
            controller: _confirmPasswordController,
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
          CustomElevatedButton(
            text: 'save',
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                );
                Navigator.pushReplacementNamed(
                    context, PageRouteName.passwordCreatedSuccessfullyView);
              }
            },
          ),
        ],
      ),
    );
  }
}
