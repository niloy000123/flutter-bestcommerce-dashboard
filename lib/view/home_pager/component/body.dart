import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../../../view_model/navigate_view_model.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.controller, this.provider})
      : super(key: key);
  final PageController controller;
  final NavigateViewModel? provider;
  @override
  Widget build(BuildContext context) {
    List<dynamic> pageViewList = PAGE_VIEW_LIST;
    return SafeArea(
      child: PageView.builder(
        onPageChanged: (value) {
          provider!.setCurrentPage(value);
        },
        controller: controller,
        itemCount: pageViewList.length,
        itemBuilder: (context, index) {
          return pageViewList[index];
        },
      ),
    );
  }
}
