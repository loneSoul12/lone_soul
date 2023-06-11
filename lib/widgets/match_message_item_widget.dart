import 'package:flutter/material.dart';
import 'package:lone_soul/app_styles.dart';
import 'package:lone_soul/models/match.dart';

class MatchMessageItemWidget extends StatelessWidget {
  final MatchUser user;
  final VoidCallback onTap;
  const MatchMessageItemWidget({
    super.key,
    required this.user,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              clipBehavior: Clip.hardEdge,
              height: 150,
              child: AspectRatio(
                aspectRatio: 3 / 4,
                child: user.match?.imageUrl != null
                    ? Image.network(
                        user.match!.imageUrl!,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        'assets/images/p2.jpeg',
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            const SizedBox(height: 3),
            SizedBox(
              width: 100,
              child: Text(
                user.match?.username ?? '',
                style: AppStyles.text.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
                maxLines: 1,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
