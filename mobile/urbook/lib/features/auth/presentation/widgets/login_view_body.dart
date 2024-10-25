import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:urbook/core/routes/page_route_name.dart';
import 'package:urbook/core/themes/color_palette.dart';
import 'package:urbook/core/utils/assets_manager/icon_paths.dart';
import 'package:urbook/core/widgets/custom_elevated_button.dart';
import 'login_form.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({
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
          "signup",
          style: theme.textTheme.titleLarge,
        ).tr(),
        const SizedBox(height: 15.0),
        Row(
          children: [
            Text(
              'Do_not_have_an_account',
              style: theme.textTheme.bodyMedium,
            ).tr(),
            InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, PageRouteName.signupView);
              },
              child: Text(
                ' signup',
                style: theme.textTheme.bodyMedium!
                    .copyWith(color: LightColorPalette.cyan),
              ).tr(),
            ),
          ],
        ),
        const SizedBox(height: 40.0),
        const logInForm(),
        const SizedBox(height: 20.0),
        CustomElevatedButton(
          text: 'signup_with_google',
          onPressed: () {},
          backGroundColor: LightColorPalette.white,
          textColor: LightColorPalette.black,
          haveIcon: true,
          iconPath: IconPaths.google,
        ),
        const SizedBox(height: 150),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Text(
              "privacy_policy",
              style: theme.textTheme.bodySmall,
            ).tr(),
          ),
        ),
      ],
    );
  }
}
