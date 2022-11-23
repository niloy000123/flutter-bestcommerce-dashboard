import 'package:flutter/material.dart';

import '../../../component/widget.dart';
import '../../../utils/constants.dart';
import '../../../utils/size_config.dart';
import '../../../view_model/navigate_view_model.dart';

class CustomBtmNavigationBar extends StatelessWidget {
  const CustomBtmNavigationBar({
    Key? key,
    this.controller,
    required this.provider,
  }) : super(key: key);
  final PageController? controller;
  final NavigateViewModel provider;
  @override
  Widget build(BuildContext context) {
    final currentPage = provider.getCurrentPage;
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenWidth(5),
          horizontal: getProportionateScreenWidth(10)),
      // height: getProportionateScreenHeight(70),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, -5),
                blurRadius: 20,
                color: const Color(0xFFDADADA).withOpacity(0.5)),
          ]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
                NAVIGATE_BOTTOM_IMAGES.length,
                (index) => navigationCard(controller!, currentPage,
                    NAVIGATE_BOTTOM_IMAGES[index], index)),
          ),
        ],
      ),
    );
  }
}
