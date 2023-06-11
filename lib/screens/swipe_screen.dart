import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:lone_soul/global_user.dart';
import 'package:lone_soul/models/match.dart';
import 'package:lone_soul/services/db/request_db_methods.dart';
import 'package:lone_soul/widgets/home_item_widget.dart';
import 'package:lone_soul/widgets/swipe_item_widget.dart';

class SwipeScreen extends StatefulWidget {
  final List<MatchUser> users;
  const SwipeScreen({
    super.key,
    required this.users,
  });

  @override
  State<SwipeScreen> createState() => _SwipeScreenState();
}

class _SwipeScreenState extends State<SwipeScreen> {
  AppinioSwiperController controller = AppinioSwiperController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.white,
      //   leading: IconButton(
      //     icon: const Icon(Icons.arrow_back_ios),
      //     color: Colors.black,
      //     onPressed: () {
      //       Navigator.of(context).pop();
      //     },
      //   ),
      // ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            AppinioSwiper(
              controller: controller,
              padding: EdgeInsets.zero,
              cardsCount: widget.users.length,
              swipeOptions: AppinioSwipeOptions.horizontal,
              onSwipe: (index, direction) async {
                if (direction == AppinioSwiperDirection.right) {
                  final requestDbMethods = RequestDBMethods();
                  await requestDbMethods.sendRequest(
                    globalUser!.userId ?? '',
                    widget.users[index].match?.userId ?? '',
                  );
                }
              },
              cardsBuilder: (BuildContext context, int index) {
                return SwipeItemWidget(
                    user: widget.users[index],
                    onInfo: () {
// Navigator.of(context).push(MaterialPageRoute(builder: (c) => ))
                    },
                    onConnect: () {
                      final requestDbMethods = RequestDBMethods();
                      requestDbMethods.sendRequest(
                        globalUser!.userId ?? '',
                        widget.users[index].match?.userId ?? '',
                      );
                      controller.swipeRight();
                    },
                    onReject: () {
                      final requestDbMethods = RequestDBMethods();
                      requestDbMethods.sendRequest(
                        globalUser!.userId ?? '',
                        widget.users[index].match?.userId ?? '',
                      );
                      controller.swipeLeft();
                    });
              },
            ),
            Positioned(
              top: kToolbarHeight,
              left: 15,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.all(15),
                  child: const Icon(Icons.arrow_back_ios_new),
                  // onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
