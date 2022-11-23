import 'package:flutter/material.dart';
import 'package:flutter_bestcommerce_dashboard/view/home/component/body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String routeName = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return const Scaffold(body: Body());
  }

  @override
  bool get wantKeepAlive => true;
}
