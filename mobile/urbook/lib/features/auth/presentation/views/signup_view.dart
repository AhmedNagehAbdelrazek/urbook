import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:urbook/core/widgets/app_bar.dart';
import 'package:urbook/features/auth/presentation/managers/auth_cubit/auth_cubit.dart';
import 'package:urbook/features/auth/presentation/widgets/signup_widgets/signup_view_body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQury = MediaQuery.sizeOf(context);
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        appBar: customAppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
              child: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return SignupViewBody(mediaQury: mediaQury, theme: theme);
            },
          )),
        ),
      ),
    );
  }
}
