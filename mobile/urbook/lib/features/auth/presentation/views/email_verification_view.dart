import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:urbook/core/routes/page_route_name.dart';
import 'package:urbook/core/themes/color_palette.dart';
import 'package:urbook/core/widgets/custom_elevated_button.dart';

class EmailVerificationView extends StatefulWidget {
  const EmailVerificationView({super.key});

  @override
  _EmailVerificationViewState createState() => _EmailVerificationViewState();
}

class _EmailVerificationViewState extends State<EmailVerificationView> {
  final List<TextEditingController> _controllers =
      List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());
  int code = 0;
  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _onDigitEntered(int index) {
    if (_controllers[index].text.isNotEmpty && index < 5) {
      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
    } else if (_controllers[index].text.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
    }
  }

  void _resendCode() {
    setState(() {
      for (var controller in _controllers) {
        controller.text = "";
      }
    });
  }

  void _proceed() {
    setState(() {
      var stringCode = '';
      for (var controller in _controllers) {
        stringCode += controller.text.toString();
        code = int.parse(stringCode);
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(code.toString())),
      );
      Navigator.pushNamed(context, PageRouteName.createPasswordView);
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQury = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('verification_code').tr(),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: mediaQury.height * 0.05),
            Text(
              'email_verification',
              style: theme.textTheme.titleLarge,
            ).tr(),
             SizedBox(height: 10.h),
            Text(
              'enter_the_6-digit_verification',
              style: theme.textTheme.bodyMedium,
            ).tr(),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(6, (index) {
                return SizedBox(
                  width: 40,
                  child: TextField(
                    controller: _controllers[index],
                    focusNode: _focusNodes[index],
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    style:  TextStyle(fontSize: 20.sp),
                    decoration: InputDecoration(
                      counterText: '',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onChanged: (_) => _onDigitEntered(index),
                  ),
                );
              }),
            ),
             SizedBox(height: 20.w),
            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: _resendCode,
                child: Text('resend_code',
                        style: theme.textTheme.bodyMedium!
                            .copyWith(color: LightColorPalette.cyan))
                    .tr(),
              ),
            ),
             SizedBox(height: 20.h),
            CustomElevatedButton(onPressed: _proceed, text: 'proceed')
          ],
        ),
      ),
    );
  }
}
