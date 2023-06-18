import 'package:e_wallet_mobile/models/operator_card_model.dart';
import 'package:e_wallet_mobile/shared/theme.dart';
import 'package:flutter/material.dart';

class DataProviderItem extends StatelessWidget {

  final OperatorCardModel operatorCardModel;
  final bool? isSelected;

  const DataProviderItem({
    Key? key,
    required this.operatorCardModel,
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
            operatorCardModel.thumbnail!.toString(),
            height: 30,
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                operatorCardModel.name!.toString(),
                style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium
                ),
              ),
              const SizedBox(height: 2),
              Text(
                operatorCardModel.status.toString(),
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
