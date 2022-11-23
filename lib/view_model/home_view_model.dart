import 'package:flutter/cupertino.dart';
import 'package:flutter_bestcommerce_dashboard/model/featured_product.dart';

import '../model/users_error.dart';

class HomeViewModel extends ChangeNotifier {
  int _currentPage = 1;
  List<FeaturedProduct> _productList = [];
  UserError? _userError;
  bool _loading = false;
  int _totalPages = 0;

  bool get loading => _loading;
  int get currentPage => _currentPage;
  UserError? get userError => _userError;
  List<FeaturedProduct>? get productList => _productList;

  setLoding(bool loading) {
    _loading = loading;
    notifyListeners();
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
