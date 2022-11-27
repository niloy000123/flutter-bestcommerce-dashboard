import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/constants.dart';
import '../../../utils/size_config.dart';

class Categories extends StatelessWidget {
  const Categories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {
        "icon": "assets/icons/Flash Icon.svg",
        "text": "Flash Deal",
        "value": cMore
      },
      {
        "icon": "assets/icons/Bill Icon.svg",
        "text": "Brands",
        "value": cBrands
      },
      {
        "icon": "assets/icons/Game Icon.svg",
        "text": "Top Cetegories",
        "value": cCategory
      },
      {
        "icon": "assets/icons/Gift Icon.svg",
        "text": "Top Sellers",
        "value": cTopSell
      },
      {"icon": "assets/icons/Discover.svg", "text": "More", "value": cMore},
    ];
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(10)),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...List.generate(
              categories.length,
              (index) => CategoryCard(
                    icon: categories[index]['icon'],
                    text: categories[index]['text'],
                    value: categories[index]['value'],
                  )),
          SizedBox(
            width: getProportionateScreenWidth(10),
          )
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    this.value,
  }) : super(key: key);

  final String? icon, text, value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
          onTap: () {
            if (value == cCategory) {
            } else if (value == cBrands) {
            } else if (value == cBrands ||
                value == cMore ||
                value == cTopSell) {
            } else {}
          },
          child:

              //total list
              Column(
            children: [
              Container(
                height: getProportionateScreenWidth(40),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 208, 211, 252)
                        .withOpacity(.3),
                    borderRadius: BorderRadius.circular(10)),
                child: SvgPicture.asset(
                  icon!,
                  color: kPrimaryColor,
                ),
              ),
              Text(
                text!,
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(fontSize: getProportionateScreenWidth(10)),
              )
            ],
          )),
    );
  }
}
