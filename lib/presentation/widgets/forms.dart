import 'package:e_wallet_mobile/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFormsField extends StatelessWidget {
  final String title;
  final bool obscureText;
  final TextEditingController? controller;
  final bool? isShowTitle;
  final TextInputType? type;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final Function(String)? onFieldSubmitted;

  const CustomFormsField({
    Key? key,
    required this.title,
    this.inputFormatters,
    this.validator,
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
          validator: validator,
          inputFormatters: inputFormatters,
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
