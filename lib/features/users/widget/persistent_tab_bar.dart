import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/utils.dart';

class PersistentTabBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final isDark = isDarkMode(context);
    return Container(
      decoration: BoxDecoration(
        color: isDark ? Colors.grey.shade900 : Colors.white,
        border: Border.symmetric(
          horizontal: BorderSide(
            width: 0.5,
            color: isDark ? Colors.grey.shade900 : Colors.grey.shade200,
          ),
        ),
      ),
      child: TabBar(
        labelPadding: const EdgeInsets.symmetric(
          vertical: Sizes.size10,
        ),
        indicatorColor: Theme.of(context).tabBarTheme.indicatorColor,
        indicatorSize: TabBarIndicatorSize.label,
        tabs: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size18,
            ),
            child: Icon(
              Icons.grid_4x4_rounded,
              color: isDark ? Colors.grey.shade500 : Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size18,
            ),
            child: FaIcon(
              FontAwesomeIcons.heart,
              color: isDark ? Colors.grey.shade500 : Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 47;

  @override
  double get minExtent => 47;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
