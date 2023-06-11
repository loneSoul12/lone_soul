import 'package:flutter/material.dart';
import 'package:lone_soul/app_colors.dart';
import 'package:lone_soul/app_styles.dart';
import 'package:lone_soul/models/interests.dart';
import 'package:lone_soul/models/match.dart';
import 'package:lone_soul/models/user.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/util/horizontal_scrollbar.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

class SwipeItemWidget extends StatelessWidget {
  final MatchUser user;
  final VoidCallback onInfo;
  final VoidCallback onConnect;
  final VoidCallback onReject;

  const SwipeItemWidget({
    super.key,
    required this.user,
    required this.onInfo,
    required this.onConnect,
    required this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          if (user.match?.imageUrl != null)
            Image.network(
              user.match!.imageUrl!,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
              height: double.maxFinite,
              width: double.maxFinite,
            )
          else
            Image.asset(
              'assets/images/p2.jpeg',
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
              height: double.maxFinite,
              width: double.maxFinite,
            ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.transparent, Colors.black],
                begin: FractionalOffset(0, 0.4),
                end: FractionalOffset(0, 1),
                tileMode: TileMode.clamp,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                          fontSize: 40,
                        ),
                      ),
                      TextSpan(
                        text: user.match?.age.toString(),
                        style: AppStyles.text.copyWith(
                          color: AppColors.grey,
                          fontWeight: FontWeight.normal,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                MultiSelectChipDisplay(
                  chipColor: AppColors.brown,
                  textStyle: AppStyles.text.copyWith(color: Colors.white),
                  scrollBar: HorizontalScrollBar(isAlwaysShown: true),
                  scroll: true,
                  onTap: (d) {},
                  items: user.match?.interests
                          ?.map((e) =>
                              MultiSelectItem<Interest>(e, e.interestName!))
                          .toList() ??
                      [],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: onReject,
                      child: Container(
                        height: 65,
                        width: 65,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.redAccent),
                          borderRadius: BorderRadius.circular(65),
                        ),
                        child: const Icon(Icons.close, color: Colors.redAccent),
                      ),
                    ),
                    InkWell(
                      onTap: onInfo,
                      child: Container(
                        height: 65,
                        width: 65,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(65),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: const Icon(
                          Icons.info,
                          color: Colors.grey,
                          size: 40,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: onConnect,
                      child: Container(
                        height: 65,
                        width: 65,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(65),
                          border: Border.all(color: Colors.greenAccent),
                        ),
                        child: const Icon(
                          Icons.check,
                          color: Colors.greenAccent,
                          size: 40,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          )
        ],
      ),
    );
  }
}
