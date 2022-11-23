import 'package:flutter/foundation.dart';

class NavigateViewModel extends ChangeNotifier {
  int currentPage = 2;

  int get getCurrentPage => currentPage;

  setCurrentPage(int index) {
    currentPage = index;
    notifyListeners();
  }
}
