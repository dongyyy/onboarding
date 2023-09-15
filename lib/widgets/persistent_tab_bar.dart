import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants/sizes.dart';

class PersistentTabBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.symmetric(
            horizontal: BorderSide(
              color: Colors.grey.shade200,
              width: 0.5,
            ),
          ),
        ),
        child: TabBar(
          // indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Colors.black,
          labelPadding: EdgeInsets.symmetric(
            vertical: Sizes.size10,
          ),
          labelColor: Colors.black,
          tabs: [
            Wrap(
              children: [
                Text(
                  "Threads",
                  style: TextStyle(
                      fontSize: Sizes.size20, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Wrap(
              children: [
                Text(
                  "Replies",
                  style: TextStyle(
                      fontSize: Sizes.size20, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => 47;

  @override
  double get minExtent => 47;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
