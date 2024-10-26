import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:urbook/features/auth/presentation/widgets/create_password_Widgets/create_password_view_body.dart';

class CreatePasswordView extends StatelessWidget {
  const CreatePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQury = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('forgot_password').tr(),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: CreatePasswordViewBody(
            theme: theme,
            mediaQury: mediaQury,
          ),
        ),
      ),
    );
  }
}
