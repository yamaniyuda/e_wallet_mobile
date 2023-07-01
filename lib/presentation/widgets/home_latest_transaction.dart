import 'package:e_wallet_mobile/domain/entities/transaction_entity.dart';
import 'package:e_wallet_mobile/shared/shared_method.dart';
import 'package:e_wallet_mobile/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeLatestTransaction extends StatelessWidget {
  final TransactionEntity transaction;
  final EdgeInsets? margin;

  const HomeLatestTransaction({
    Key? key,
    required this.transaction,
    this.margin
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.only(bottom: 18),
      child: Row(
        children: [
          Image.network(
            transaction.transactionType!.thumbnail!,
            width: 48,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset(
                transaction.transactionType!.action == "cr"
                    ? "assets/icons/ic_unggah.png"
                    : "assets/icons/ic_upload (1).png",
                width: 48,
              );
            },
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transaction.transactionType!.name.toString(),
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium
                ),
              ),
              const SizedBox(height: 2),
              Text(
                DateFormat("MMM dd").format(transaction.createdAt ?? DateTime.now()),
                style: grayTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: medium
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            formatCurrency(
              transaction.amount ?? 0,
              symbol: transaction.transactionType!.action == "cr"
                ? "+"
                : "-"
            ),
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium
            ),
          ),
        ],
      ),
    );
  }
}
