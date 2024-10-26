import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'create_password_form.dart';

class CreatePasswordViewBody extends StatelessWidget {
  const CreatePasswordViewBody({
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
          "new_password",
          style: theme.textTheme.titleLarge,
        ).tr(),
        const SizedBox(height: 15.0),
        Row(
          children: [
            Text(
              'enter_your_new_password_and_remember_it',
              style: theme.textTheme.bodyMedium,
            ).tr(),
          ],
        ),
        const SizedBox(height: 40.0),
        const CreatePasswordForm(),
        const SizedBox(height: 20.0),
      ],
    );
  }
}
