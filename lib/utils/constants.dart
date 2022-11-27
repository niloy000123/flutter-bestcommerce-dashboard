// ignore_for_file: non_constant_identifier_names, constant_identifier_names
import 'package:flutter/material.dart';
import 'package:flutter_bestcommerce_dashboard/view/home/home_screen.dart';

import '../view/second_page/second_page.dart';

const kPrimaryColor = Color(0xFF1E9EFD);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryOrange = Color(0xFFFF7643);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color.fromARGB(255, 92, 92, 92);

// category

const String cMore = "more";
const String cBrands = "Brands";
const String cCategory = "category";
const String cTopSell = "top_sell";

//----------navigate buttom------------------//
final List<dynamic> PAGE_VIEW_LIST = [
  const SecondPageScreen(),
  const SecondPageScreen(),
  const HomeScreen(),
  const SecondPageScreen(),
  const SecondPageScreen(),
];

final List<String> NAVIGATE_BOTTOM_IMAGES = [
  "assets/icons/User Icon.svg",
  "assets/icons/Heart Icon.svg",
  "assets/icons/home.svg",
  "assets/icons/Purchase.svg",
  "assets/icons/Bell.svg"
];

const IMAGE_NOT_FOUND = 'profile/no_img_found_2022_07_28T07_26_25_945Z.png';

//error
const USER_INVALID_RESPONSE = 100;
const NO_INTERNATE = 101;
const INVALID_FORMAT = 102;
const UNKNOWN_ERROR = 103;

const BASE_URL = 'http://nodeback.flutterondemand.com/';
const GET_FEATURE_PRODUCT = '${BASE_URL}product/featured_product/';
const GET_BANNER_IMAGE = '${BASE_URL}banner/get_home_img';
const GET_SUB_CATEGORY = '${BASE_URL}category/sub_category';
