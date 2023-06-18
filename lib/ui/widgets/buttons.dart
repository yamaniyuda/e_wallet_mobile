import 'package:e_wallet_mobile/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomFilledButton extends StatefulWidget {
  final String title;
  final double height;
  final double width;
  final VoidCallback? onPress;

  const CustomFilledButton({
    Key? key,
    required this.title,
    this.width = double.infinity,
    this.height = 50,
    this.onPress
  }) : super(key: key);

  @override
  State<CustomFilledButton> createState() => _CustomFilledButtonState();
}

class _CustomFilledButtonState extends State<CustomFilledButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: TextButton(
        onPressed: widget.onPress,
        style: TextButton.styleFrom(
            backgroundColor: purpleColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(56)
            )
        ),
        child: Text(
          widget.title,
          style: whiteTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold
          ),
        ),
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  final String title;
  final double height;
  final double width;
  final VoidCallback? onPress;

  const CustomTextButton({
    Key? key,
    required this.title,
    this.width = double.infinity,
    this.height = 50,
    this.onPress
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        onPressed: onPress,
        style: TextButton.styleFrom(
            padding: EdgeInsets.zero
        ),
        child: Text(
          title,
          style: grayTextStyle.copyWith(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class CustomInputButton extends StatelessWidget {

  final String title;
  final VoidCallback? onTap;

  const CustomInputButton({
    Key? key,
    required this.title,
    this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: numberBackgroundColor
        ),
        child: Center(
          child: Text(
            title,
            style: whiteTextStyle.copyWith(
              fontSize: 22,
              fontWeight: semiBold
            ),
          ),
        ),
      ),
    );
  }
}
