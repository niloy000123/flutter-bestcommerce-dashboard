// ignore: unused_import
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bestcommerce_dashboard/view/home/component/offer_image_card.dart';

import '../../../component/dot_ind_image.dart';
import '../../../model/app_loding.dart';
import '../../../utils/size_config.dart';
import '../../../view_model/home_view_model.dart';

final PageController controller = PageController();

class OfferBannerPager extends StatelessWidget {
  const OfferBannerPager({
    Key? key,
    this.homeProvider,
  }) : super(key: key);

  final HomeViewModel? homeProvider;
  @override
  Widget build(BuildContext context) {
    //for banner auto swipe
    int currentPage = 0;
    Timer.periodic(const Duration(seconds: 7), (Timer timer) {
      if (currentPage < 2) {
        currentPage++;
      } else {
        currentPage = 0;
      }

      controller.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
    if (homeProvider!.loading) {
      return const AppLoading();
    }
    if (homeProvider!.bannerError != null) {
      return Text(homeProvider!.bannerError!.message.toString());
    }
    return SizedBox(
      height: getProportionateScreenWidth(170),
      child: Stack(
        children: [
          PageView.builder(
            controller: controller,
            itemCount: homeProvider!.offerBanner!.length,
            itemBuilder: (context, index) {
              return OfferImageCard(
                image: homeProvider!.offerBanner![index].image,
              );
            },
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: SizedBox(
              height: getProportionateScreenWidth(25),
              child: ImgDotIndicator(
                controller: controller,
                itemCount: homeProvider!.offerBanner!.length,
                color: Colors.grey[600]!,
                onPageSelected: (int page) {},
              ),
            ),
          )
        ],
      ),
    );
  }
}
