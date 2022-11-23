import 'package:flutter/cupertino.dart';
import 'package:flutter_bestcommerce_dashboard/model/featured_product.dart';
import 'package:flutter_bestcommerce_dashboard/repo/home_serviec.dart';

import '../model/users_error.dart';
import '../repo/api_status.dart';

class HomeViewModel extends ChangeNotifier {
  int _currentPage = 1;
  List<FeaturedProduct> _productList = [];
  ServiceError? _userError;
  bool _loading = false;
  int _totalPages = 0;

  bool get loading => _loading;
  int get currentPage => _currentPage;
  int get totalPages => _totalPages;
  ServiceError? get userError => _userError;
  List<FeaturedProduct>? get productList => _productList;

  setLoding(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  setFeaturedProduct(List<FeaturedProduct> list) {
    _productList = list;
  }

  addFeaturedProduct(List<FeaturedProduct> list) {
    _productList.addAll(list);
  }

  setUserError(ServiceError userError) {
    _userError = userError;
  }

  setCurrentPage(int currentPage) {
    _currentPage = currentPage;
  }

  setTotalPages(int totalPages) {
    _totalPages = totalPages;
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
    setLoding(true);
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
    setLoding(false);
    return result;
  }

  // Future<bool> fetchFeaturedProduct({bool isRefresh = false}) async {
  //   try {
  //     if (isRefresh) {
  //       currentPage = 1;
  //     } else {
  //       if (currentPage > totalPages) {
  //         return false;
  //       }
  //     }
  //     Map<String, String> headers = {
  //       "Accept": "application/json",
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     };

  //     Map<String, dynamic> data = {"numPerPage": 6, "page": currentPage};
  //     final response = await http.post(Uri.parse(getFeaturedProduct),
  //         body: jsonEncode(data), headers: headers);
  //     var body = json.decode(response.body);
  //     if (body['status'] == 200) {
  //       List<FeaturedProduct> list = (body['data'] as List)
  //           .map((data) => FeaturedProduct.fromJson(data))
  //           .toList();

  //       currentPage++;

  //       if (isRefresh) {
  //         productList = [];
  //         productList = shuffle(list);
  //         totalPages = body['pages'];
  //       } else {
  //         productList.addAll(list);
  //       }
  //       setState(() {});
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   } catch (e) {
  //     return false;
  //   }
  // }
}
