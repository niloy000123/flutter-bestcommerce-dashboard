import 'package:flutter/material.dart';
import 'package:flutter_bestcommerce_dashboard/utils/constants.dart';
import 'package:flutter_bestcommerce_dashboard/view/home_pager/home_pager.dart';

import '../utils/size_config.dart';
import '../view_model/navigate_view_model.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({
    Key? key,
    required this.navProvider,
  }) : super(key: key);
  final NavigateViewModel navProvider;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        height: double.infinity,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: () {
                navProvider.setCurrentPage(0);
                HomePager.controller.animateToPage(
                  navProvider.getCurrentPage,
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.easeInOutCubic,
                );
              },
              child: ClipOval(
                child: Image.asset(
                  'assets/images/default_user.png',
                  fit: BoxFit.cover,
                  height: 30,
                  width: 30,
                ),
              ),
            ),
            const Spacer(),
            Text(
              'BESTCOMMERCE',
              style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: getProportionateScreenWidth(17),
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1),
            )
          ],
        ),
      ),
    );
  }
}
