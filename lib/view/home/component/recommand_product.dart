import 'package:flutter/material.dart';
import 'package:flutter_bestcommerce_dashboard/view/home/component/recommand_product_card.dart';

import '../../../model/featured_product.dart';
import '../../../utils/size_config.dart';

class RecommandProducts extends StatelessWidget {
  const RecommandProducts({
    Key? key,
    this.product,
  }) : super(key: key);

  final List<FeaturedProduct>? product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(15)),
      child: GridView.builder(
        itemCount: product!.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: .73,
            mainAxisSpacing: getProportionateScreenWidth(15),
            crossAxisSpacing: getProportionateScreenWidth(10)),
        itemBuilder: (context, index) => RecommandProductCard(
          product: product![index],
          press: () {},
        ),
      ),
    );
  }
}
