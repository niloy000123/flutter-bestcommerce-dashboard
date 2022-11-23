import 'package:flutter/material.dart';
import 'package:flutter_bestcommerce_dashboard/view/home_pager/component/body.dart';
import 'package:flutter_bestcommerce_dashboard/view/home_pager/component/bottom_navigationbar.dart';
import 'package:provider/provider.dart';
import '../../component/custom_home_appbar.dart';
import '../../utils/size_config.dart';
import '../../view_model/navigate_view_model.dart';

class HomePager extends StatelessWidget {
  const HomePager({super.key});
  static String routeName = "/home_pager";
  static PageController controller =
      PageController(initialPage: 2, keepPage: false);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    NavigateViewModel navProvider = Provider.of<NavigateViewModel>(context);

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(AppBar().preferredSize.height),
          child: CustomHomeAppBar(navProvider: navProvider)),
      body: Body(
        provider: navProvider,
        controller: controller,
      ),
      bottomNavigationBar: CustomBtmNavigationBar(
        provider: navProvider,
        controller: controller,
      ),
    );
  }
}
