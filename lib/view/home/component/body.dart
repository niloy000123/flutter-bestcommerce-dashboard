import 'package:flutter/material.dart';
import 'package:flutter_bestcommerce_dashboard/view/home/component/recommand_product.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../component/widget.dart';
import '../../../view_model/home_view_model.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final RefreshController refreshController =
      RefreshController(initialRefresh: true);
  @override
  Widget build(BuildContext context) {
    HomeViewModel homeProvider = Provider.of<HomeViewModel>(context);
    return SmartRefresher(
      controller: refreshController,
      enablePullUp: true,
      onRefresh: () async {
        final result = await homeProvider.getFeaturedProduct(isRefresh: true);
        if (result) {
          refreshController.refreshCompleted();
        } else {
          refreshController.refreshFailed();
        }
      },
      onLoading: () async {
        final result = await homeProvider.getFeaturedProduct();
        if (result) {
          refreshController.loadComplete();
        } else {
          refreshController.loadComplete();
          // refreshController.loadNoData();
        }
      },
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //banner Image
            // FutureBuilder(
            //   future: fetchOfferBanner(),
            //   builder: (context, AsyncSnapshot snapshot) => snapshot.hasData
            //       ? OfferBannerPager(
            //           model: snapshot.data,
            //         )
            //       : Center(child: Image.asset("assets/ripple.gif")),
            // ),
            // //category list
            // const Categories(),
            // //featured product
            // const FeaturedCategory(),
            headingText("Featured Products"),
            //products

            RecommandProducts(
              product: homeProvider.productList,
            ),
          ],
        ),
      ),
    );
  }
}
