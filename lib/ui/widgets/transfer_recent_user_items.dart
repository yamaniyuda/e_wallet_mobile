import 'package:e_wallet_mobile/models/user_model.dart';
import 'package:e_wallet_mobile/shared/theme.dart';
import 'package:flutter/material.dart';

class TransferRecentUserItems extends StatelessWidget {

  final UserModel user;

  const TransferRecentUserItems({
    Key? key,
    required this.user
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor
      ),
      child: Row(
        children: [
          Container(
            width: 45,
            height: 45,
            margin: EdgeInsets.only(right: 14),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: user.profilePicture != null
                  ? NetworkImage(user.profilePicture!)
                  : const AssetImage("assets/images/img_priend_1.png") as ImageProvider
              )
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.name!,
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium
                ),
              ),
              const SizedBox(height: 2),
              Text(
                "@${user.username}",
                style: grayTextStyle.copyWith(
                  fontSize: 12
                ),
              ),
            ],
          ),
          const Spacer(),
          if (user.verified == 1) Row(
            children: [
              const Icon(
                Icons.check_circle,
                color: greenColor,
                size: 14,
              ),
              const SizedBox(width: 4),
              Text(
                "Verified",
                style: greenTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 11
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
