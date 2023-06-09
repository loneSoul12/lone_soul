import 'package:flutter/material.dart';
import 'package:lone_soul/app_styles.dart';

class MatchMessageItemWidget extends StatelessWidget {
  final String name;
  final String image;
  final VoidCallback onTap;
  const MatchMessageItemWidget({
    super.key,
    required this.name,
    required this.image,
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
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 3),
            SizedBox(
              width: 100,
              child: Text(
                name,
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
