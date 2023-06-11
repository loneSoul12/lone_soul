import 'package:flutter/material.dart';
import 'package:lone_soul/app_colors.dart';
import 'package:lone_soul/app_styles.dart';
import 'package:lone_soul/models/match.dart';
import 'package:lone_soul/models/user.dart';

class HomeItemWidget extends StatelessWidget {
  final MatchUser user;
  final VoidCallback onTap;

  const HomeItemWidget({
    super.key,
    required this.onTap,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        clipBehavior: Clip.hardEdge,
        child: Stack(
          children: [
            if (user.match?.imageUrl != null)
              Image.network(
                user.match!.imageUrl!,
                fit: BoxFit.cover,
                height: double.maxFinite,
                width: double.maxFinite,
              )
            else
              Image.asset(
                'assets/images/p2.jpeg',
                fit: BoxFit.cover,
                height: double.maxFinite,
                width: double.maxFinite,
              ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.black],
                  begin: FractionalOffset(0, 0.65),
                  end: FractionalOffset(0, 1),
                  tileMode: TileMode.clamp,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '${user.match?.username ?? ''}, ',
                          style: AppStyles.text.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        TextSpan(
                          text: user.match?.age.toString(),
                          style: AppStyles.text.copyWith(
                            color: AppColors.grey,
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
