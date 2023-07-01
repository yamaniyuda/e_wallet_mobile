import 'package:e_wallet_mobile/shared/theme.dart';
import 'package:flutter/material.dart';

class ProfileMenuItem extends StatelessWidget {

  final String iconUrl;
  final String title;
  final VoidCallback? onTap;
  final EdgeInsets margin;

  const ProfileMenuItem({
    Key? key,
    required this.iconUrl,
    required this.title,
    this.margin = const EdgeInsets.only(bottom: 30),
    this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin,
        child: Row(
          children: [
            Image.asset(
              iconUrl,
              width: 24,
            ),
            const SizedBox(width: 18),
            Text(
              title,
              style: blackTextStyle.copyWith(
                fontWeight: medium
              ),
            )
          ],
        ),
      ),
    );
  }
}
