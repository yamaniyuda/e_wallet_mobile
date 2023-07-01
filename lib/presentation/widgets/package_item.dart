import 'package:e_wallet_mobile/domain/entities/data_plan_entity.dart';
import 'package:e_wallet_mobile/shared/shared_method.dart';
import 'package:e_wallet_mobile/shared/theme.dart';
import 'package:flutter/material.dart';

class PackageItem extends StatelessWidget {

  final DataPlanEntity dataPlanModel;
  final bool isSelected;

  const PackageItem({
    Key? key,
    required this.dataPlanModel,
    this.isSelected = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 155,
        height: 173,
        // margin: const EdgeInsets.only(bottom: 18),
        padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 22
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: whiteColor,
            border: Border.all(
                color: isSelected ? blueColor : whiteColor
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              dataPlanModel.name.toString(),
              style: blackTextStyle.copyWith(
                  fontSize: 32,
                  fontWeight: medium
              ),
            ),
            const SizedBox(height: 2),
            Text(
              formatCurrency(dataPlanModel.price ?? 0),
              style: grayTextStyle.copyWith(
                  fontSize: 12
              ),
            )
          ],
        )
    );
  }
}