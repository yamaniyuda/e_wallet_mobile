import 'package:e_wallet_mobile/domain/entities/tip_entity.dart';
import 'package:e_wallet_mobile/models/tip_model.dart';
import 'package:e_wallet_mobile/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeTipsItem extends StatelessWidget {
  final TipEntity tip;

  const HomeTipsItem({Key? key, required this.tip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (await canLaunchUrl(Uri.parse(tip.url.toString()))) {
          launchUrl(Uri.parse(tip.url.toString()),
              mode: LaunchMode.inAppWebView);
        }
      },
      child: Container(
        width: 155,
        height: 180,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: whiteColor),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                tip.thumbnail.toString(),
                width: double.infinity,
                height: 90,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  tip.title.toString(),
                  style: blackTextStyle.copyWith(
                      fontWeight: medium, overflow: TextOverflow.ellipsis),
                  maxLines: 2,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
