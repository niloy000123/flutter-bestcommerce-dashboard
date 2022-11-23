import 'package:flutter/material.dart';
import '../../../component/widget.dart';
import '../../../model/featured_product.dart';
import '../../../utils/constants.dart';
import '../../../utils/size_config.dart';

class RecommandProductCard extends StatelessWidget {
  const RecommandProductCard({
    Key? key,
    this.product,
    this.press,
  }) : super(key: key);

  final FeaturedProduct? product;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    String imgUrl = product!.images == null || product!.images == ''
        ? BASE_URL + IMAGE_NOT_FOUND
        : BASE_URL + product!.images!.split(' ')[0];
    // var img = product!.images!.split(' ');
    return GestureDetector(
      onTap: press,
      child: Card(
        elevation: 2,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(getProportionateScreenWidth(8)),
            // border:
            //     Border.all(color: kSecondaryColor.withOpacity(.3), width: 1)
          ),
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: Hero(
                      tag: product!.id.toString(),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FadeInImage.assetNetwork(
                            placeholder: "assets/spinner.gif",
                            image: imgUrl,
                            fit: BoxFit.cover,
                            imageErrorBuilder: (context, error, stacktrace) {
                              return FadeInImage.assetNetwork(
                                  placeholder: "assets/spinner.gif",
                                  image: imgUrl,
                                  fit: BoxFit.fill,
                                  imageErrorBuilder:
                                      (context, error, stacktrace) {
                                    return FadeInImage.assetNetwork(
                                        placeholder: "assets/spinner.gif",
                                        image: imgUrl,
                                        fit: BoxFit.fill,
                                        imageErrorBuilder:
                                            (context, error, stacktrace) {
                                          return const Center(
                                              child:
                                                  Text('Image Not Available'));
                                        });
                                  });
                            }
                            // height: SizeConfig.screenWidth * .4,
                            ),
                      ),
                    ),
                  ),
                  if (product!.newPrice != product!.price)
                    Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.red.withOpacity(0.7),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(
                                      getProportionateScreenWidth(4)),
                                  bottomRight: Radius.circular(
                                      getProportionateScreenWidth(9)))),
                          padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(5)),
                          child: normalText(
                              text: '7.0%',
                              color: Colors.white,
                              fontSize: getProportionateScreenWidth(10)),
                        ))
                ],
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                          Colors.grey.withOpacity(.01),
                          Colors.grey.withOpacity(.1)
                        ])),
                    child: Column(
                      children: [
                        normalText(
                            text: product!.title.toString(),
                            color: Colors.black,
                            fontSize: getProportionateScreenWidth(11)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (product!.newPrice != product!.price)
                              Text(
                                product!.price.toString() + ' ',
                                style: const TextStyle(
                                    decoration: TextDecoration.lineThrough),
                              ),
                            Text(
                              product!.newPrice.toString() + '\$',
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: getProportionateScreenWidth(15),
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        )

                        // Spacer(),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
