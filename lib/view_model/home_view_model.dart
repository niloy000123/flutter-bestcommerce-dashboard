// ignore_for_file: prefer_final_fields

import 'package:flutter/cupertino.dart';
import 'package:flutter_bestcommerce_dashboard/model/featured_product.dart';
import 'package:flutter_bestcommerce_dashboard/model/offer_banner.dart';
import 'package:flutter_bestcommerce_dashboard/repo/home_serviec.dart';

import '../model/sub_category.dart';
import '../model/users_error.dart';
import '../repo/api_status.dart';

class HomeViewModel extends ChangeNotifier {
  int _currentPage = 1;
  List<FeaturedProduct> _productList = [];
  List<OfferBanner> _offerBannerList = [];
  List<SubCategory> _subCatList = [];
  ServiceError? _userError;
  ServiceError? _bannerError;
  ServiceError? _cateError;
  bool _loading = false;
  int _totalPages = 0;

  bool get loading => _loading;
  int get currentPage => _currentPage;
  int get totalPages => _totalPages;
  ServiceError? get userError => _userError;
  ServiceError? get bannerError => _bannerError;
  ServiceError? get cateError => _cateError;
  List<FeaturedProduct>? get productList => _productList;
  List<OfferBanner>? get offerBanner => _offerBannerList;
  List<SubCategory>? get subCatList => _subCatList;

  setLoding(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  setFeaturedProduct(List<FeaturedProduct> list) {
    _productList = list;
  }

  setOfferBanner(List<OfferBanner> list) {
    _offerBannerList = list;
  }

  addFeaturedProduct(List<FeaturedProduct> list) {
    _productList.addAll(list);
  }

  setSubCatList(List<SubCategory> list) {
    _subCatList.addAll(list);
  }

  setUserError(ServiceError userError) {
    _userError = userError;
  }

  setBannerError(ServiceError bannerError) {
    _bannerError = bannerError;
  }

  setCategoryError(ServiceError cateError) {
    _cateError = cateError;
  }

  setCurrentPage(int currentPage) {
    _currentPage = currentPage;
  }

  setTotalPages(int totalPages) {
    _totalPages = totalPages;
  }

  HomeViewModel() {
    getBanners();
    getSubCategory();
  }

  Future<bool> getFeaturedProduct({bool isRefresh = false}) async {
    bool result = true;
    if (isRefresh) {
      setCurrentPage(1);
    } else {
      if (currentPage > totalPages) {
        result = false;
        return result;
      }
    }
    var response = await HomeServices.getFeaturedProduct(
        isRefresh: isRefresh,
        totalPages: _totalPages,
        currentPage: _currentPage);
    if (response is Success) {
      setCurrentPage(currentPage + 1);
      if (isRefresh) {
        setFeaturedProduct(response.responce as List<FeaturedProduct>);
        setTotalPages(response.toatalPage!);
      } else {
        addFeaturedProduct(response.responce as List<FeaturedProduct>);
      }

      result = true;
    }
    if (response is Failure) {
      ServiceError userError =
          ServiceError(code: response.code, message: response.errorResponce);
      setUserError(userError);
      result = false;
    }
    notifyListeners();
    return result;
  }

  getBanners() async {
    setLoding(true);
    var response = await HomeServices.getOfferBanner();
    if (response is Success) {
      setOfferBanner(response.responce as List<OfferBanner>);
    }
    if (response is Failure) {
      ServiceError bannerError =
          ServiceError(code: response.code, message: response.errorResponce);
      setBannerError(bannerError);
    }
    setLoding(false);
  }

  getSubCategory() async {
    var response = await HomeServices.getSubCategory();
    if (response is Success) {
      setSubCatList(response.responce as List<SubCategory>);
    }
    if (response is Failure) {
      ServiceError error =
          ServiceError(code: response.code, message: response.errorResponce);
      setCategoryError(error);
    }
    notifyListeners();
  }
}
