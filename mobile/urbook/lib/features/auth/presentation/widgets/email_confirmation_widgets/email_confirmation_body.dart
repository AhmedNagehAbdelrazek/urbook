import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'email_confirmation_form.dart';

class EmailConfirmationBody extends StatelessWidget {
  const EmailConfirmationBody({
    super.key,
    required this.mediaQury,
    required this.theme,
  });

  final Size mediaQury;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: mediaQury.height * 0.04,
        ),
        Text(
          "confirmation_email",
          style: theme.textTheme.titleLarge,
        ).tr(),
        const SizedBox(height: 15.0),
        Text(
          'Enter_your_email_address_for_verification',
          style: theme.textTheme.bodyMedium,
        ).tr(),
        const SizedBox(height: 40.0),
        const EmailConfirmationForm(),
        const SizedBox(height: 20.0),
        const SizedBox(height: 150),
      ],
    );
  }
}
