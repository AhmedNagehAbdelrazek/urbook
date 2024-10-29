import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:urbook/core/routes/page_route_name.dart';
import 'package:urbook/core/themes/application_theme_manager.dart';
import 'package:urbook/core/constants/image_paths.dart';
import 'package:urbook/core/widgets/custom_elevated_button.dart';

class PasswordCreatedSuccessfullyView extends StatelessWidget {
  const PasswordCreatedSuccessfullyView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 30),
              width: double.infinity,
              decoration: BoxDecoration(
                color: theme.primaryColorLight,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Image.asset(ImagePaths.lock, scale: 0.7),
            ),
            Text(
              "new_password_set_successfully".tr(),
              style: theme.textTheme.titleLarge,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                textAlign: TextAlign.center,
                "password_has_been_set_successfully".tr(),
                style: theme.textTheme.bodyMedium!
                    .copyWith(fontWeight: FontWeight.normal),
              ),
            ),
            CustomElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, PageRouteName.loginView);
                },
                text: "login")
          ],
        ),
      ),
    );
  }
}
