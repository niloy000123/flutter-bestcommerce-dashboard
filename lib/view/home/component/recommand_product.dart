import 'package:flutter/material.dart';
import 'package:flutter_bestcommerce_dashboard/view/home/component/recommand_product_card.dart';
import '../../../model/app_loding.dart';
import '../../../utils/size_config.dart';
import '../../../view_model/home_view_model.dart';

class RecommandProducts extends StatelessWidget {
  const RecommandProducts({
    Key? key,
    this.homeProvider,
  }) : super(key: key);

  final HomeViewModel? homeProvider;

  @override
  Widget build(BuildContext context) {
    if (homeProvider!.loading) {
      return const AppLoading();
    }
    if (homeProvider!.userError != null) {
      return Text(homeProvider!.userError!.message.toString());
    }
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(15)),
      child: GridView.builder(
        itemCount: homeProvider!.productList!.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: .73,
            mainAxisSpacing: getProportionateScreenWidth(15),
            crossAxisSpacing: getProportionateScreenWidth(10)),
        itemBuilder: (context, index) => RecommandProductCard(
          product: homeProvider!.productList![index],
          press: () {},
        ),
      ),
    );
  }
}
