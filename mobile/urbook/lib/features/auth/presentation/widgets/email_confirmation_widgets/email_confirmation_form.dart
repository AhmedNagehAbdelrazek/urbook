import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:urbook/core/widgets/custom_elevated_button.dart';

import '../../managers/auth_cubit/auth_cubit.dart';

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
    var cubitManager = AuthCubit.get(context);
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "email",
            style: theme.textTheme.bodyLarge,
          ).tr(),
          SizedBox(height: 8.0.h),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'email'.tr(),
              border: const OutlineInputBorder(),
              hintText: 'enter_your_email'.tr(),
            ),
            validator: _validateEmail,
          ),
          SizedBox(height: 16.0.h),
          SizedBox(height: 30.0.h),
          CustomElevatedButton(
            text: 'send',
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                cubitManager
                    .forgotPassword(email: _emailController.text.trim())
                    .then((value) {
                  if (value) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("success")),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("fail")),
                    );
                  }
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
