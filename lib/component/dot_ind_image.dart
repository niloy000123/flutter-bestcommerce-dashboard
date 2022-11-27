import 'package:flutter/material.dart';

import '../utils/size_config.dart';

class ImgDotIndicator extends AnimatedWidget {
  ImgDotIndicator({
    Key? key,
    this.controller,
    this.itemCount,
    this.onPageSelected,
    this.color = Colors.grey,
  }) : super(key: key, listenable: controller!);

  /// The PageController that this DotsIndicator is representing.
  final PageController? controller;

  /// The number of items managed by the PageController
  final int? itemCount;

  /// Called when a dot is tapped
  final ValueChanged<int>? onPageSelected;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(itemCount!, (index) => _buildDot(index)),
    );
  }

  Widget _buildDot(int index) {
    double page = 0.0;
    if (controller!.page == null) {
      page = 0;
    } else {
      page = controller!.page!;
    }
    return SizedBox(
      child: SizedBox(
        width: getProportionateScreenWidth(20),
        child: Material(
          color: page == index ? Colors.white : color,
          type: MaterialType.circle,
          child: SizedBox(
            width: page == index
                ? getProportionateScreenWidth(12)
                : getProportionateScreenWidth(8),
            height: page == index
                ? getProportionateScreenWidth(12)
                : getProportionateScreenWidth(8),
          ),
        ),
      ),
    );
  }
}
