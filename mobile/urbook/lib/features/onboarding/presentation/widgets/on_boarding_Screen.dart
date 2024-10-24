import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({
    super.key,
    required this.imagesPath,
    required this.title,
    required this.description,
  });
  final String imagesPath;
  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: theme.primaryColorLight,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Image.asset(imagesPath),
        ),
        Text(
          title.tr(),
          style: theme.textTheme.titleLarge,
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            textAlign: TextAlign.center,
            description.tr(),
            style: theme.textTheme.bodyMedium!
                .copyWith(fontWeight: FontWeight.normal),
          ),
        ),
      ],
    );
  }
}
