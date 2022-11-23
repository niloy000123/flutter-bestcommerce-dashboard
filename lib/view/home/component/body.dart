import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 1;
  List<FeaturedProduct> productList = [];
  late int totalPages = 0;
  final RefreshController refreshController =
      RefreshController(initialRefresh: true);
  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: refreshController,
      enablePullUp: true,
      onRefresh: () async {
        final result = await fetchFeaturedProduct(isRefresh: true);
        if (result) {
          refreshController.refreshCompleted();
        } else {
          refreshController.refreshFailed();
        }
      },
      onLoading: () async {
        final result = await fetchFeaturedProduct();
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
            FutureBuilder(
              future: fetchOfferBanner(),
              builder: (context, AsyncSnapshot snapshot) => snapshot.hasData
                  ? OfferBannerPager(
                      model: snapshot.data,
                    )
                  : Center(child: Image.asset("assets/ripple.gif")),
            ),
            //category list
            const Categories(),
            //featured product
            const FeaturedCategory(),
            headingText("Featured Products"),
            //products

            RecommandMyProducts(
              product: productList,
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> fetchFeaturedProduct({bool isRefresh = false}) async {
    try {
      if (isRefresh) {
        currentPage = 1;
      } else {
        if (currentPage > totalPages) {
          return false;
        }
      }
      Map<String, String> headers = {
        "Accept": "application/json",
        'Content-Type': 'application/json; charset=UTF-8',
      };

      Map<String, dynamic> data = {"numPerPage": 6, "page": currentPage};
      final response = await http.post(Uri.parse(getFeaturedProduct),
          body: jsonEncode(data), headers: headers);
      var body = json.decode(response.body);
      if (body['status'] == 200) {
        List<FeaturedProduct> list = (body['data'] as List)
            .map((data) => FeaturedProduct.fromJson(data))
            .toList();

        currentPage++;

        if (isRefresh) {
          productList = [];
          productList = shuffle(list);
          totalPages = body['pages'];
        } else {
          productList.addAll(list);
        }
        setState(() {});
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
