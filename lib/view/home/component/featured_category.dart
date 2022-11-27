import 'package:flutter/material.dart';
import 'package:flutter_bestcommerce_dashboard/utils/constants.dart';

import '../../../component/widget.dart';
import '../../../model/sub_category.dart';
import '../../../utils/size_config.dart';
import '../../../view_model/home_view_model.dart';

class FeaturedCategory extends StatelessWidget {
  const FeaturedCategory({super.key, this.homeProvider});
  final HomeViewModel? homeProvider;
  @override
  Widget build(BuildContext context) {
    if (homeProvider!.cateError != null) {
      return Text(homeProvider!.cateError!.message.toString());
    }
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...List.generate(
              homeProvider!.subCatList!.length,
              (index) => Row(
                    children: [
                      SizedBox(
                        width: getProportionateScreenWidth(10),
                      ),
                      SubCategoryCard(
                        model: homeProvider!.subCatList![index],
                        press: () {},
                      ),
                    ],
                  )),
        ],
      ),
    );
  }
}

class SubCategoryCard extends StatelessWidget {
  const SubCategoryCard({Key? key, this.press, this.model}) : super(key: key);
  final VoidCallback? press;
  final SubCategory? model;
  @override
  Widget build(BuildContext context) {
    String imgUrl = model!.subCategoryImg == null || model!.subCategoryImg == ''
        ? BASE_URL + IMAGE_NOT_FOUND
        : BASE_URL + model!.subCategoryImg.toString();
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                border:
                    Border.all(width: 1, color: Colors.grey.withOpacity(.3))),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(50.0)),
              child: FadeInImage.assetNetwork(
                  placeholder: "assets/spinner.gif",
                  image: imgUrl,
                  fit: BoxFit.cover,
                  width: getProportionateScreenWidth(85),
                  height: getProportionateScreenWidth(90),
                  imageErrorBuilder: (context, error, stacktrace) {
                    return FadeInImage.assetNetwork(
                        placeholder: "assets/spinner.gif",
                        image: imgUrl,
                        fit: BoxFit.cover,
                        imageErrorBuilder: (context, error, stacktrace) {
                          return FadeInImage.assetNetwork(
                              placeholder: "assets/spinner.gif",
                              image: imgUrl,
                              fit: BoxFit.cover,
                              imageErrorBuilder: (context, error, stacktrace) {
                                return const Center(
                                    child: Text('Image Not Available'));
                              });
                        });
                  }),
            ),
          ),
          normalText(text: model!.subCategoryName.toString()),
        ],
      ),
    );
  }
}
