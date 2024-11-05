import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:urbook/features/auth/presentation/managers/auth_cubit/auth_cubit.dart';

import '../widgets/email_confirmation_widgets/email_confirmation_body.dart';

class EmailConfirmationView extends StatelessWidget {
  const EmailConfirmationView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQury = MediaQuery.sizeOf(context);
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('forgot_password').tr(),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                return EmailConfirmationBody(
                  mediaQury: mediaQury,
                  theme: theme,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
