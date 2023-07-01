import 'package:e_wallet_mobile/domain/entities/user_entity.dart';
import 'package:e_wallet_mobile/shared/theme.dart';
import 'package:flutter/material.dart';

class HomeUserItems extends StatefulWidget {

  final UserEntity user;

  const HomeUserItems({
    Key? key,
    required this.user
  }) : super(key: key);

  @override
  State<HomeUserItems> createState() => _HomeUserItemsState();
}

class _HomeUserItemsState extends State<HomeUserItems> {
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: 120,
      height: 120,
      margin: const EdgeInsets.only(right: 17),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 45,
            height: 45,
            margin: const EdgeInsets.only(bottom: 13),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  widget.user.profilePicture!,
                )
              )
            ),
          ),
          Text(
            "@ ${widget.user.name}",
            textAlign: TextAlign.center,
            style: blackTextStyle.copyWith(
              fontSize: 12,
              fontWeight: medium
            ),
          )
        ],
      ),
    );
  }
}
