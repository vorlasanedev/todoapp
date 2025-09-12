import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todoapp/utils/extensions.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    super.key,
    required this.title,
    required this.hintText,
    this.controller,
    this.maxLines = 1,
    this.suffixIcon,
    this.readOnly = false,
  });

  final String title;
  final String hintText; // renamed from nintText
  final TextEditingController? controller; // renamed from nintText
  final int? maxLines;
  final Widget? suffixIcon;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(title, style: context.textTheme.titleLarge),
        const Gap(5),
        TextField(
          controller: controller,
          readOnly: readOnly,
          maxLines: maxLines,
          onTapOutside: (event) => {
            FocusManager.instance.primaryFocus?.unfocus(),
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                10.0,
              ), // Adjust radius as needed
            ),
            labelText: hintText, // Label above input
            hintText: hintText, // Placeholder inside input
            alignLabelWithHint: true,
            suffixIcon: suffixIcon,
          ),
          onChanged: (value) => {},
        ),
        const Gap(5),
      ],
    );
  }
}
