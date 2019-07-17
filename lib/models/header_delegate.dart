import 'package:flutter/material.dart';
import 'dart:math';

import 'mock_camera.dart';

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    if (true) {
      print(shrinkOffset);
      return SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.deepPurple, Colors.deepOrange],
            ),
          ),
          child: Stack(
            children: [
              SizedBox.expand(child: child),
              Positioned(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Container(
                    height: 475 - shrinkOffset * 1.583,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
