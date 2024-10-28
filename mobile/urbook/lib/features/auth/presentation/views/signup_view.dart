import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:urbook/core/widgets/app_bar.dart';
import 'package:urbook/features/auth/presentation/widgets/signup_widgets/signup_view_body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQury = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: customAppBar(),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
            child: SignupViewBody(mediaQury: mediaQury, theme: theme)),
      ),
    );
  }
}
