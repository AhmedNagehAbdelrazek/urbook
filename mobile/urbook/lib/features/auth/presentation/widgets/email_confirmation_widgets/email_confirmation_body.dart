import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          height: mediaQury.height * 0.04.h,
        ),
        Text(
          "confirmation_email",
          style: theme.textTheme.titleLarge,
        ).tr(),
         SizedBox(height: 15.0.h),
        Text(
          'Enter_your_email_address_for_verification',
          style: theme.textTheme.bodyMedium,
        ).tr(),
         SizedBox(height: 40.0.h),
        const EmailConfirmationForm(),
         SizedBox(height: 20.0.h),
         SizedBox(height: 150.h),
      ],
    );
  }
}
