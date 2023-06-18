import 'package:e_wallet_mobile/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomFormsField extends StatelessWidget {
  final String title;
  final bool obscureText;
  final TextEditingController? controller;
  final bool? isShowTitle;
  final TextInputType? type;
  final Function(String)? onFieldSubmitted;

  const CustomFormsField({
    Key? key,
    required this.title,
    this.obscureText = false,
    this.isShowTitle = true,
    this.controller,
    this.onFieldSubmitted,
    this.type
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isShowTitle == true) Text(
          title,
          style: blackTextStyle.copyWith(
              fontWeight: medium
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          obscureText: obscureText,
          keyboardType: type,
          controller: controller,
          onFieldSubmitted: onFieldSubmitted,
          decoration: InputDecoration(
              hintText: isShowTitle == false ? title : null,
              contentPadding: const EdgeInsets.all(12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
              )
          ),
        )
      ],
    );
  }
}
