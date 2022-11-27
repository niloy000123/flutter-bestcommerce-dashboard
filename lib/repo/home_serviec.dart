import 'dart:convert';
import 'dart:io';
import 'package:flutter_bestcommerce_dashboard/model/featured_product.dart';
import 'package:flutter_bestcommerce_dashboard/repo/api_status.dart';
import 'package:http/http.dart' as http;

import '../model/offer_banner.dart';
import '../model/sub_category.dart';
import '../utils/constants.dart';

class HomeServices {
  static Future<Object> getFeaturedProduct(
      {bool isRefresh = false, int currentPage = 0, int totalPages = 0}) async {
    try {
      Map<String, String> headers = {
        "Accept": "application/json",
        'Content-Type': 'application/json; charset=UTF-8',
      };
      Map<String, dynamic> data = {"numPerPage": 6, "page": currentPage};
      var url = Uri.parse(GET_FEATURE_PRODUCT);
      var response =
          await http.post(url, headers: headers, body: jsonEncode(data));
      var body = json.decode(response.body);
      if (body['status'] == 200) {
        return Success(
            responce: (body['data'] as List)
                .map((data) => FeaturedProduct.fromJson(data))
                .toList(),
            toatalPage: body['pages']);
      }
      return Failure(
          code: USER_INVALID_RESPONSE, errorResponce: 'USER_INVALID_RESPONSE');
    } on HttpException {
      return Failure(code: NO_INTERNATE, errorResponce: 'NO_INTERNATE');
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponce: 'INVALID_FORMAT');
    } catch (e) {
      return Failure(code: UNKNOWN_ERROR, errorResponce: 'UNKNOWN_ERROR');
    }
  }

  static Future<Object> getOfferBanner() async {
    try {
      final response = await http.post(Uri.parse(GET_BANNER_IMAGE));
      var body = json.decode(response.body);
      if (body['status'] == 200) {
        List<OfferBanner> coverImage = (body['data'] as List)
            .map((data) => OfferBanner.fromJson(data))
            .toList();
        return Success(responce: coverImage);
      } else {
        return Failure(
            code: USER_INVALID_RESPONSE,
            errorResponce: 'USER_INVALID_RESPONSE');
      }
    } on HttpException {
      return Failure(code: NO_INTERNATE, errorResponce: 'NO_INTERNATE');
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponce: 'INVALID_FORMAT');
    } catch (e) {
      return Failure(code: UNKNOWN_ERROR, errorResponce: 'UNKNOWN_ERROR');
    }
  }

  static Future<Object> getSubCategory() async {
    try {
      final response = await http.get(Uri.parse(GET_SUB_CATEGORY));
      var body = json.decode(response.body);
      if (body['status'] == 200) {
        List<SubCategory> category = (body['data'] as List)
            .map((data) => SubCategory.fromJson(data))
            .toList();
        return Success(responce: category);
      } else {
        return Failure(
            code: USER_INVALID_RESPONSE,
            errorResponce: 'USER_INVALID_RESPONSE');
      }
    } on HttpException {
      return Failure(code: NO_INTERNATE, errorResponce: 'NO_INTERNATE');
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponce: 'INVALID_FORMAT');
    } catch (e) {
      return Failure(code: UNKNOWN_ERROR, errorResponce: 'UNKNOWN_ERROR');
    }
  }
}
