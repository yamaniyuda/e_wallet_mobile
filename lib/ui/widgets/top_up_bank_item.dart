import 'package:e_wallet_mobile/models/payment_method_model.dart';
import 'package:e_wallet_mobile/shared/theme.dart';
import 'package:flutter/material.dart';

class TopUpBankItem extends StatelessWidget {

  final PaymentMethodModel paymentMethodModel;
  final String date;
  final bool? isSelected;

  const TopUpBankItem({
    Key? key,
    required this.paymentMethodModel,
    required this.date,
    this.isSelected = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: whiteColor,
        border: Border.all(
          width: 2,
          color: isSelected == true ? blueColor : whiteColor
        ),
        borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        children: [
          Image.network(
            paymentMethodModel.thumbnail!,
            height: 30,
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                paymentMethodModel.name.toString(),
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium
                ),
              ),
              const SizedBox(height: 2),
              Text(
                "50 mins",
                style: grayTextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}