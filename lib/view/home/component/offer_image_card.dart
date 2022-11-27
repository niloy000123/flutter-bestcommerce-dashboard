import 'package:flutter/material.dart';
import 'package:flutter_bestcommerce_dashboard/utils/constants.dart';

import '../../../utils/size_config.dart';

class OfferImageCard extends StatelessWidget {
  const OfferImageCard({
    Key? key,
    this.image,
  }) : super(key: key);
  final String? image;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
      width: double.infinity,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(getProportionateScreenWidth(8)),
          child: FadeInImage.assetNetwork(
            placeholder: "assets/spinner.gif",
            image: BASE_URL + image!,
            fit: BoxFit.fill,
            height: double.infinity,
          )),
    );
  }
}
