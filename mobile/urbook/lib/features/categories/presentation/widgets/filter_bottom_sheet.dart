import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:urbook/core/widgets/custom_elevated_button.dart';
import 'package:urbook/features/auth/presentation/views/create_password_view.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  _FilterBottomSheetState createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'filter',
            style: theme.textTheme.bodyLarge,
          ).tr(),
          const SizedBox(height: 16),
          _buildOption('Price (Low to High)'),
          _buildOption('Price (High to Low)'),
          _buildOption('A-Z'),
          _buildOption('Z-A'),
          const SizedBox(height: 16),
          CustomElevatedButton(
            onPressed: () {
              Navigator.pop(context, selectedOption);
            },
            text: 'apply',
          ),
        ],
      ),
    );
  }

  Widget _buildOption(String title) {
    var theme = Theme.of(context);
    return RadioListTile<String>(
      title: Text(
        title,
        style: theme.textTheme.bodyMedium,
      ),
      value: title,
      groupValue: selectedOption,
      onChanged: (value) {
        setState(() {
          selectedOption = value;
        });
      },
    );
  }
}
