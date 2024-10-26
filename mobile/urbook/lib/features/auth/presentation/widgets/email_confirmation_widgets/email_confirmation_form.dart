import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:urbook/core/widgets/custom_elevated_button.dart';

class EmailConfirmationForm extends StatefulWidget {
  const EmailConfirmationForm({super.key});

  @override
  _EmailConfirmationFormState createState() => _EmailConfirmationFormState();
}

class _EmailConfirmationFormState extends State<EmailConfirmationForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

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
          const SizedBox(height: 30.0),
          CustomElevatedButton(
            text: 'send',
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
