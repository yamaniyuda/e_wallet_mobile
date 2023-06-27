import 'package:e_wallet_mobile/domain/entities/user_entity.dart';
import 'package:e_wallet_mobile/shared/theme.dart';
import 'package:flutter/material.dart';

class TransferResultUserItems extends StatelessWidget {

  final UserEntity user;
  final bool isSelected;

  const TransferResultUserItems({
    Key? key,
    required this.user,
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
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: user.profilePicture != null
                        ? NetworkImage(user.profilePicture!)
                        : const AssetImage("assets/images/img_friend_1") as ImageProvider
                )
            ),
            child: user.verified == 1 ? Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 16,
                width: 16,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: whiteColor
                ),
                child: const Center(
                  child: Icon(
                    Icons.check_circle,
                    color: greenColor,
                    size: 14,
                  ),
                ),
              ),
            ) : null,
          ),
          const SizedBox(height: 13),
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
            overflow: TextOverflow.ellipsis,
            style: grayTextStyle.copyWith(
              fontSize: 12,
            ),
          )
        ],
      )
    );
  }
}