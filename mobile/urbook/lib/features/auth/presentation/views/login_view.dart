import 'package:flutter/material.dart';
import 'package:urbook/core/widgets/app_bar.dart';
import 'package:urbook/features/auth/presentation/widgets/login_widgets/login_view_body.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQury = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: customAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
            child: LoginViewBody(mediaQury: mediaQury, theme: theme)),
      ),
    );
  }
}
